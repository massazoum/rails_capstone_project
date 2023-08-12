// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("DOMContentLoaded", function () {
 const openModalButton = document.getElementById("open-inventory-modal");

 const closeModalButton = document.getElementById("close-inventory-modal");
 const modal = document.getElementById("My_MODAL_ID");

 modal.style.display  = "none";

 openModalButton.addEventListener("click", function () {
   modal.style.display = "block";
 });

 openModalButton.addEventListener("click", function () {
  modal.style.display = "block";
});

closeModalButton.addEventListener("click", function () {
 modal.style.display = "none";
});

window.addEventListener("click", function (event) {
 if (event.target === modal) {
   modal.style.display = "none";
 }
});
});
