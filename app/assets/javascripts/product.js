function toggleDescription(buttonElement, descriptionElement, maxHeight) {
    if (descriptionElement.style.maxHeight === '') {
        descriptionElement.style.maxHeight = `${maxHeight}px`;
        buttonElement.textContent = 'Show more';
    }
    else {
        descriptionElement.style.maxHeight = '';
        buttonElement.textContent = 'Show less';
    }
}
