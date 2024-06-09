let currentSlides = [0, 0, 0];
const slideContainers = [
    document.querySelectorAll('#slider1 .slide'),
    document.querySelectorAll('#slider2 .slide'),
    document.querySelectorAll('#slider3 .slide')
];

function showSlide(sliderIndex, index) {
    slideContainers[sliderIndex][currentSlides[sliderIndex]].classList.remove('show');
    currentSlides[sliderIndex] = (index + slideContainers[sliderIndex].length) % slideContainers[sliderIndex].length;
    slideContainers[sliderIndex][currentSlides[sliderIndex]].classList.add('show');
}

function showPrevious(sliderIndex) {
    showSlide(sliderIndex, currentSlides[sliderIndex] - 1);
}

function showNext(sliderIndex) {
    showSlide(sliderIndex, currentSlides[sliderIndex] + 1);
}

// Automatically advance slides every 5 seconds
function autoAdvance(sliderIndex) {
    setInterval(() => {
        showNext(sliderIndex);
    }, 5000); // 5000 milliseconds = 5 seconds
}

// Start auto advancing all sliders
for (let i = 0; i < slideContainers.length; i++) {
    autoAdvance(i);
}



