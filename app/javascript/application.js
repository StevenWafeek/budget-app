// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

if (document.querySelector(".categories-container .categories-header i")) {
    document.querySelector(".categories-container .categories-header i"),addEventListener("click", (e) => {
        if(e.target == document.querySelector(".categories-container .categories-header i") || 
        e.target == document.querySelector(".categories-container .menu") ||
        e.target == document.querySelector(".categories-container .menu *") ||
        e.target == document.querySelector(".categories-container .menu ul li") ||
        e.target == document.querySelector(".categories-container .menu ul li form") ||
        e.target == document.querySelector(".categories-container .menu ul li form button")){
            document.querySelector(".categories-container .menu").style.marginLeft = 0;
        } else {
            document.querySelector(".categories-container .menu").style.marginLeft = "-83vw"; 
        }
    });
}
