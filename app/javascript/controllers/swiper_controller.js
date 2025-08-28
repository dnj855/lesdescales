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
    
    // Check if this is a gallery swiper (multiple images per slide) or mascotte swiper (single image with fade)
    const isGallery = this.containerTarget.classList.contains('gallery-swiper')
    
    if (isGallery) {
      // Initialize Gallery Swiper with multiple slides per view
      this.swiper = new window.Swiper(this.containerTarget, {
        // Basic parameters
        slidesPerView: 1,
        spaceBetween: 16,
        loop: false,
        speed: 600,
        
        // Responsive breakpoints - showing multiple pictures per slide on larger screens
        breakpoints: {
          // when window width is >= 640px (sm)
          640: {
            slidesPerView: 2,
            spaceBetween: 16
          },
          // when window width is >= 768px (md)
          768: {
            slidesPerView: 2,
            spaceBetween: 20
          },
          // when window width is >= 1024px (lg)
          1024: {
            slidesPerView: 3,
            spaceBetween: 24
          },
          // when window width is >= 1280px (xl)
          1280: {
            slidesPerView: 3,
            spaceBetween: 24
          }
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
          dynamicMainBullets: 5
        },
        
        // Touch/Mouse events
        grabCursor: true,
        
        // Keyboard control
        keyboard: {
          enabled: true,
          onlyInViewport: true,
        },
        
        // Lazy loading
        lazy: {
          loadPrevNext: true,
          loadPrevNextAmount: 2
        },
        
        // Accessibility
        a11y: {
          enabled: true,
          prevSlideMessage: 'Photo précédente',
          nextSlideMessage: 'Photo suivante',
          firstSlideMessage: 'Première photo',
          lastSlideMessage: 'Dernière photo',
          paginationBulletMessage: 'Aller à la photo {{index}}',
        },
      })
    } else {
      // Initialize Mascotte Swiper with fade effect (single image)
      this.swiper = new window.Swiper(this.containerTarget, {
        // Basic parameters
        loop: true,
        speed: 600,
        spaceBetween: 30,
        centeredSlides: true,
        slidesPerView: 1,
        
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
}