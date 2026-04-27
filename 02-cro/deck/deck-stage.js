class DeckStage extends HTMLElement {
  constructor() {
    super();
    this._current = 0;
    this._slides = [];
    this._controlTimeout = null;
    this._bound = {
      key: this._onKey.bind(this),
      resize: this._scale.bind(this),
      click: this._onClick.bind(this),
    };
  }

  connectedCallback() {
    this._slides = Array.from(this.querySelectorAll('.slide'));
    if (!this._slides.length) return;

    const saved = parseInt(localStorage.getItem('deck-current') || '0', 10);
    this._current = Math.min(saved, this._slides.length - 1);

    this._buildChrome();
    this._show(this._current, false);
    this._scale();

    window.addEventListener('keydown', this._bound.key);
    window.addEventListener('resize', this._bound.resize);
    this.addEventListener('click', this._bound.click);
  }

  disconnectedCallback() {
    window.removeEventListener('keydown', this._bound.key);
    window.removeEventListener('resize', this._bound.resize);
  }

  _buildChrome() {
    const ctrl = document.createElement('div');
    ctrl.className = 'deck-ctrl';
    ctrl.innerHTML = `<span class="deck-counter"></span>`;
    document.body.appendChild(ctrl);
    this._ctrl = ctrl;
    this._counter = ctrl.querySelector('.deck-counter');
  }

  _show(index, animate = true) {
    this._slides.forEach((s, i) => {
      s.classList.toggle('active', i === index);
      s.classList.toggle('prev', i < index);
    });
    this._current = index;
    localStorage.setItem('deck-current', index);
    if (this._counter) {
      this._counter.textContent = `${index + 1} / ${this._slides.length}`;
    }
    this._showCtrl();
  }

  _showCtrl() {
    if (this._ctrl) this._ctrl.classList.add('visible');
    clearTimeout(this._controlTimeout);
    this._controlTimeout = setTimeout(() => {
      if (this._ctrl) this._ctrl.classList.remove('visible');
    }, 2500);
  }

  _next() { if (this._current < this._slides.length - 1) this._show(this._current + 1); }
  _prev() { if (this._current > 0) this._show(this._current - 1); }

  _onKey(e) {
    const map = {
      ArrowRight: () => this._next(),
      ArrowDown: () => this._next(),
      ' ': () => this._next(),
      PageDown: () => this._next(),
      ArrowLeft: () => this._prev(),
      ArrowUp: () => this._prev(),
      PageUp: () => this._prev(),
      Home: () => this._show(0),
      End: () => this._show(this._slides.length - 1),
      r: () => this._show(0),
      R: () => this._show(0),
    };
    if (e.key >= '1' && e.key <= '9') {
      const i = parseInt(e.key, 10) - 1;
      if (i < this._slides.length) this._show(i);
      return;
    }
    if (map[e.key]) { e.preventDefault(); map[e.key](); }
  }

  _onClick(e) {
    const w = this.offsetWidth;
    if (e.clientX < w * 0.33) this._prev();
    else if (e.clientX > w * 0.67) this._next();
  }

  _scale() {
    const W = 1920, H = 1080;
    const sw = window.innerWidth, sh = window.innerHeight;
    const scale = Math.min(sw / W, sh / H);
    const left = (sw - W * scale) / 2;
    const top  = (sh - H * scale) / 2;
    this.style.width = W + 'px';
    this.style.height = H + 'px';
    this.style.position = 'absolute';
    this.style.left = left + 'px';
    this.style.top  = top + 'px';
    this.style.transform = `scale(${scale})`;
    this.style.transformOrigin = 'top left';
    document.body.style.margin = '0';
    document.body.style.overflow = 'hidden';
    document.body.style.width = sw + 'px';
    document.body.style.height = sh + 'px';
  }
}

customElements.define('deck-stage', DeckStage);
