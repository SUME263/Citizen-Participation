// Ensure DOM is loaded before attaching event listeners
document.addEventListener("DOMContentLoaded", function() {

    // Validate Register form
    const registrationForm = document.getElementById('registrationForm');
    if (registrationForm) {
        registrationForm.addEventListener('submit', function (e) {
            e.preventDefault();

            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                alert('Passwords do not match!');
                return;
            }

            alert('Registration successful!');
            // Redirect or integrate with backend here
        });
    }

    document.querySelector('.hamburger').addEventListener('click', () => {
        document.querySelector('.navbar').classList.toggle('active');
    });
    

    // Validate Login Form
    const loginForm = document.getElementById('loginForm');
    if (loginForm) {
        loginForm.addEventListener('submit', function (e) {
            e.preventDefault();

            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            if (!email || !password) {
                alert('Please fill out all fields!');
                return;
            }

            alert('Login successful!');
            // Redirect or integrate with backend here
        });
    }

    // // Slideshow functionality for the introduction part
    let currentSlide = 0;
    const slides = document.querySelectorAll(".slide");

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.style.display = i === index ? "block" : "none";
        });
    }

    function changeSlide(direction) {
        currentSlide = (currentSlide + direction + slides.length) % slides.length;
        showSlide(currentSlide);
    }

    // Initialize slideshow
    showSlide(currentSlide);
    setInterval(() => changeSlide(1), 5000); // Auto-change every 5 seconds

      // Slideshow functionality for multiple slideshows
      const slideshows = document.querySelectorAll(".feature-slideshow");

      slideshows.forEach((slideshow) => {
          let currentSlide = 0;
          const slides = slideshow.querySelectorAll(".slide");
  
          function showSlide(index) {
              slides.forEach((slide, i) => {
                  slide.style.display = i === index ? "block" : "none";
              });
          }
  
          function changeSlide(direction) {
              currentSlide = (currentSlide + direction + slides.length) % slides.length;
              showSlide(currentSlide);
          }
  
          // Initialize slideshow
          showSlide(currentSlide);
          setInterval(() => changeSlide(1), 4000); // Auto-change every 4 seconds
      });
});

