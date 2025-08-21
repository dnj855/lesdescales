import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swiper"
export default class extends Controller {
  static targets = ["container", "pagination"]

  connect() {
    this.initializeSwiper()
  }

  disconnect() {
    if (this.swiper) {
      this.swiper.destroy(true, true)
    }
  }

  initializeSwiper() {
    // Wait for Swiper to be available from CDN
    if (typeof window.Swiper === 'undefined') {
      console.warn('Swiper not loaded yet, retrying...')
      setTimeout(() => this.initializeSwiper(), 100)
      return
    }
    
    // Initialize Swiper for mascotte gallery
    this.swiper = new window.Swiper(this.containerTarget, {
      // Basic parameters
      loop: true,
      speed: 600,
      spaceBetween: 30,
      centeredSlides: true,
      
      // Autoplay
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
        pauseOnMouseEnter: true,
      },
      
      // Navigation arrows
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      
      // Pagination
      pagination: {
        el: this.paginationTarget,
        clickable: true,
        dynamicBullets: true,
      },
      
      // Touch/Mouse events
      grabCursor: true,
      
      // Effects
      effect: 'fade',
      fadeEffect: {
        crossFade: true
      },
      
      // Responsive breakpoints
      breakpoints: {
        640: {
          slidesPerView: 1,
          spaceBetween: 20,
        },
        768: {
          slidesPerView: 1,
          spaceBetween: 30,
        },
        1024: {
          slidesPerView: 1,
          spaceBetween: 30,
        },
      },
      
      // Keyboard control
      keyboard: {
        enabled: true,
        onlyInViewport: true,
      },
      
      // Accessibility
      a11y: {
        enabled: true,
        prevSlideMessage: 'Image précédente',
        nextSlideMessage: 'Image suivante',
        firstSlideMessage: 'Première image',
        lastSlideMessage: 'Dernière image',
        paginationBulletMessage: 'Aller à l\'image {{index}}',
      },
    })
  }
}