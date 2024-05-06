const dropdownClassName = "show-dropdown";

function setDropdownVisibility(element, show) {
    const arrow = element.querySelector('.dropdown-arrow')

    if (show) {
        element.classList.add(dropdownClassName);
        arrow.className = "dropdown-arrow dropdown-arrow-down";
    }
    else {
        element.classList.remove(dropdownClassName);
        arrow.className = "dropdown-arrow dropdown-arrow-left";
    }
}

function toggleDropdownVisibility(element) {
    element.classList.toggle(dropdownClassName);

    const arrow = element.querySelector('.dropdown-arrow');

    if (arrow.classList.contains('dropdown-arrow-down')) {
        arrow.className = "dropdown-arrow dropdown-arrow-left";
    }
    else {
        arrow.className = "dropdown-arrow dropdown-arrow-down";
    }
}

// function toggleDescription(buttonElement, descriptionElement, maxHeight) {
//     e = buttonElement;
//     console.log(descriptionElement)
//     if (descriptionElement.style.maxHeight === '') {
//         descriptionElement.style.maxHeight = `${maxHeight}px`;
//         buttonElement.innerHtml = 'Show less';
//     }
//     else {
//         descriptionElement.style.maxHeight = '';
//         buttonElement.innerHtml = 'Show more';
//     }
// }
