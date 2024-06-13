function showDiv() {
  var div = document.getElementById("div_hide_click");
  div.style.display = "block";
}

function hideDiv() {
  var div = document.getElementById("div_hide_click");
  div.style.display = "none";
}


function show_div_click(item) {
  var div = document.querySelector('.' + item);
  if (div.style.display == "none")
    div.style.display = "block";
  else
    div.style.display = "none";
}

function listn5(i) {
  var elements = document.querySelector(".gioi_thieu_n5");
    elements.style.display = "none";
  var elements = document.querySelectorAll(".listn5_content");
  elements.forEach(function(element) {
    element.style.display = "none";
  });
  var div = document.getElementById(i)
  div.style.display = "block";

}


function toggleDiv(item, mui_ten) {
  var div = document.getElementById(item);
  var element = document.querySelector(mui_ten);
  element.style.transform = "rotate(180deg)";
    
  if (div.style.display === "block") {
    div.style.display = "none";
    element.style.transform = "rotate(90deg)";
  } else {
    div.style.display = "block";
  }
}


function toggleFlashcardDetails(element) {
  $(element).find('p').toggle(); // Toggle visibility of all <p> elements within the flashcard-details div
}


document.addEventListener('DOMContentLoaded', function() {
  var flashcards = document.querySelectorAll('.flashcard');
  var currentIndex = 0;
  var prevButton = document.querySelector('.prev-button');
  var nextButton = document.querySelector('.next-button');
  var messageElement = document.createElement('div');
  messageElement.classList.add('message');
  messageElement.textContent = '';
  document.querySelector('.use_flashcard').appendChild(messageElement);

  function showFlashcard(index) {
    flashcards.forEach(function(card, i) {
      card.style.display = i === index ? 'block' : 'none';
    });
    messageElement.textContent = '';
  }

  prevButton.addEventListener('click', function() {
    currentIndex = Math.max(currentIndex - 1, 0);
    showFlashcard(currentIndex);
  });

  nextButton.addEventListener('click', function() {
    if (currentIndex === flashcards.length - 1) {
      messageElement.textContent = 'Đã đến cuối danh sách flashcard.';
    } else {
      currentIndex = Math.min(currentIndex + 1, flashcards.length - 1);
      showFlashcard(currentIndex);
    }
  });

  showFlashcard(currentIndex);
});