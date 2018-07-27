function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  // var image = document.querySelector('img');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add('navbar-wagon-white');
        // image.src = "/assets/logo.jpg"
      } else {
        navbar.classList.remove('navbar-wagon-white');
        // image.src = ""
      }
    });
  }
}
export { initUpdateNavbarOnScroll };
