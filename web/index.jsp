<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Customizable Navbar</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha384-xLzgTbDlMywnNwFyEnAImjb8eO+ZCBfMQo8zK71aXPOJjYNs1p3+9Tm+6+L3Oy3y" crossorigin="anonymous">

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <style>

        </style>

    </head>

    <body>

        <script>
            window.onload = function () {
                var successMessage = getCookie("login_success");
                if (successMessage) {
                    alert(successMessage);
                    // Optionally, you can clear the cookie after displaying the message
                    document.cookie = "login_success=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/finalprojectjava;";
                    window.location.href = "index.jsp"; // Redirect to index.html
                }
            }

            function getCookie(name) {
                var nameEQ = name + "=";
                var cookies = document.cookie.split(';');
                for (var i = 0; i < cookies.length; i++) {
                    var cookie = cookies[i];
                    while (cookie.charAt(0) == ' ') {
                        cookie = cookie.substring(1, cookie.length);
                    }
                    if (cookie.indexOf(nameEQ) == 0) {
                        return decodeURIComponent(cookie.substring(nameEQ.length, cookie.length));
                    }
                }
                return null;
            }
        </script>







        <header>
            <nav class="navbar">
                <div class="logo" style="" >
                    <img src="Main.png" alt="Logo">
                </div>
                <ul class="nav-links" id="navLinks">
                    <li><a href="#home">Home</a></li>
                    <li><a href="#service">Services</a></li>
                    <li><a href="#blog">Blog</a></li>
                    <li><a href="#feature">Features</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li> <a href="index.html"><button class="login-btns">Login</button></a></li>
                    <script>
                        // Check if logout parameter indicates success, then display alert
                        const urlParams = new URLSearchParams(window.location.search);
                        const logoutParam = urlParams.get('logout');
                        if (logoutParam === 'success') {
                            alert('You have been logged out successfully.');
                        }
                    </script>


                    <li  > <a href="logout"><button  class="login-btns">Logout</button></a></li>
                </ul>
                <div class="menu-icon" onclick="toggleMenu()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                    <path d="M0 0h24v24H0z" fill="none" />
                    <path
                        d="M4 18h16c.55 0 1-.45 1-1s-.45-1-1-1H4c-.55 0-1 .45-1 1s.45 1 1 1zm0-5h16c.55 0 1-.45 1-1s-.45-1-1-1H4c-.55 0-1 .45-1 1s.45 1 1 1zM3 7c0 .55.45 1 1 1h16c.55 0 1-.45 1-1s-.45-1-1-1H4c-.55 0-1 .45-1 1z" />
                    </svg>
                </div>
            </nav>
        </header>

        <div class="menu-content" id="menuContent">
            <ul>
                <li><a href="#home">Home</a></li>
                <li><a href="#service">Services</a></li>
                <li><a href="#blog">Blog</a></li>
                <li><a href="#feature">Features</a></li>
                <li><a href="index.html"><button  class="login-btn">Login</button></a></li>
                <li  > <a href="logout"><button  class="login-btns">Logout</button></a></li>

            </ul>
        </div>

        <script>
            function toggleMenu() {
                var menuContent = document.getElementById("menuContent");
                if (menuContent.style.display === "none" || menuContent.style.display === "") {
                    menuContent.style.display = "block";
                } else {
                    menuContent.style.display = "none";
                }
            }
        </script>



    </div>
    <section id="home" class="home-section" style="min-height: 130vh;">
        <div id="scroll-container">
            <div id="scroll-text"><h3></h3><div>
                </div>
            </div>

           <div class="home1">
    <div class="plexus">
        <h1>Plexus Software</h1>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 text-center">
                        <h3 class="animate-charcter">AgenCy</h3>
                    </div>
                </div>
            </div>
            <p style="padding: 0 10% 0 10%  ">
                Welcome to Plexus Software Agency, where innovation meets excellence. Our commitment is to provide you with unparalleled solutions and service that exceed expectations. With clear documentation and meticulous attention to detail, we ensure your projects are set up seamlessly. Configure Firebase and run applications with ease, all while enjoying comprehensive support and guidance..
            </p> 
        </div>
    </div>
</div>



            <div>
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="slider.png" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="slider.png" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="d-block w-100" src="slider.png" alt="Third slide">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>

            <div>
                <a href="login.jsp" class="slider-button">More..</a>
            </div>

            <style>
                /* Define media queries for different screen sizes */
                @media screen and (max-width: 768px) {
                    .home-section {
                        min-height: 80vh !important; /* Adjust the min-height for smaller screens */

                    }

                }
            </style>

    </section>



    <section id="blog" class="home-sections" style="min-height: 80vh;" >

        <style>
            /* Define media queries for different screen sizes */
            @media screen and (max-width: 768px) {
                .home-sections {
                    min-height: 80vh !important; /* Adjust the min-height for smaller screens */

                }

            }
        </style>

        <div class="card1" >
            <div class="card1-image">
                <img src="table.jpg" alt="Example Image">
            </div>
            <div class="card1-content">
                <h2 class="card1-header">About Us</h2>
                <p class="card1-paragraph">We are experienced and professional digital marketing agency that help business achieve massive 
                    success and build strong online presence with high quality personalized services to our clients. We
                    work together to guarantee smooth elevation of brands and execute the development campaign for 
                    all business online. Each member of our team are equipped with professional skills to excel in their 
                    field. .</p>
                <button class="card1-button">Learn More</button>
            </div>
        </div>

        <div class="service1"  >
            <h1 >Our <a style=" color: #FBF8BE" >Services</a> </h1>
            <p style=" padding: 0 10% 0 10% " >we don't just provide solutions; we forge lasting partnerships built on trust and integrity. We pride ourselves on delivering data-driven results that exceed expectations. With our dedicated team by your side, you can focus on doing what you do best, knowing that our agency is committed to your success. </p>
        </div>

    </section>



    <section id="service" class="service-section" style="min-height: 60vh;">

        <div class="card">
            <img src="pngegg.png" alt="Image 1">
            <div class="card-content">
                <h3>"Web Development"</h3>
                <p>Developing website using ReactJS and MongoDb as database storage. We are responsible for developing a responsive web application for our beloved clients.</p>
                <button>See more</button>
            </div>
        </div>

        <div class="card">

            <img  style=" height: 50% " src="pngegg 1.png" alt="Image 2">
            <div class="card-content">
                <h3>"Graphic Designing"</h3>
                <p>Developing website using ReactJS and MongoDb as database storage. We are responsible for developing a responsive web application for our beloved clients.</p>
                <button>See more</button>
            </div>
        </div>

        <div class="card"  >
            <img style=" height: 50%  " src="pngegg 2png.png" alt="Image 3">
            <div class="card-content">
                <h3>"SEO Optimization"</h3>
                <p>Elevating online visibility and organic traffic through strategic optimization techniques.</p>
                <button>See more</button>
            </div>
        </div>

        <div class="card">
            <img style=" height: 50% " src="pngegg 3.png" alt="Image 4">
            <div class="card-content">
                <h3>"Social Media Marketing"</h3>
                <p>Amplifying brand presence and engagement with tailored social strategies and compelling content.</p>
                <button>See more</button>
            </div>
        </div>

    </section>

    <section id="feature" class="home-sections" style="min-height: 80vh;">
        <style>
            /* Define media queries for different screen sizes */
            @media screen and (max-width: 768px) {
                .home-sections {
                    min-height: 60vh !important; /* Adjust the min-height for smaller screens */

                }

            }
        </style>
        <div class="feature1">
            <h2 class="header">How can we assist you on your <a style=" color: #FBF8BE " >journey?</a></h2>
            <p class="paragraph">Let us be your guide towards achieving your goals and realizing your vision. Together, we can navigate challenges, explore opportunities, and bring your ideas to life. Take the first step towards collaboration and partnership. Let's embark on this journey together, where we'll work hand in hand to create meaningful and impactful outcomes. Your success is our priority, and we're committed to supporting you every step of the way.</p>
            <img src="Plans.png" alt="Image">
            <div class="buttons">
                <button class="button1">Get Consultation</button>

            </div>
        </div>

    </section>



    <section id="here">
        <div class="here2">
            <h1>Article <a style=" color: #234E70 ">Vlog..</a> </h1>
            <p>Discover mindfulness's transformative potential! Embrace practices that reduce stress, foster emotional balance, and enhance overall well-being. Learn to integrate mindfulness into daily life for greater self-awareness and connection with the present moment. Through mindfulness, cultivate resilience, inner peace, and clarity. Explore techniques that promote a deeper understanding of yourself and your surroundings. Begin your journey towards a more mindful existence today, and experience the profound impact it can have on your mental and emotional state. Embrace the power of mindfulness to transform your perspective and enrich your life in profound ways..</p>
        </div>

        <div class="card-here">
            <div class="card2">
                <img style=" height: 50%"  src="hu1.png" alt="Image">
                <div class="card-content">
                    <h3 >"Discover Our Latest Insights"</h3>
                    <p class="card-paragraph">Explore our diverse collection of articles and blogs where we unravel industry trends, share expert insights, and offer valuable tips and advice. Stay informed, inspired, and empowered as we delve into the world of technology and innovation</p>
                    <button class="card-button">See more</button>
                </div>
            </div>
            <div class="card2">
                <img style=" height: 50%"  src="hu2.png" alt="Image">
                <div class="card-content">
                    <h3>"Stay Informed, Stay Ahead"</h3>
                    <p class="card-paragraph"> Dive into our repository of articles and vlogs designed to keep you updated on the latest developments in the tech sphere. From emerging technologies to best practices, we curate content that equips you with the knowledge ahead in today's </p>
                    <button class="card-button">See more</button>
                </div>
            </div>
            <div class="card2">
                <img  style=" height: 50%" src="hub3.png" alt="Image">
                <div class="card-content">
                    <h3>"Unleash the Power of Knowledge"</h3>
                    <p class="card-paragraph">Unlock a wealth of knowledge and expertise through our engaging articles and vlogs. Delve into topics ranging from software development methodologies to industry insights and thought leadership pieces. Empower yourself with valuable info..</p>
                    <button class="card-button">See more</button>
                </div>
            </div>
        </div>
    </section>



    <!-- contact us  -->


    <section id="contact"  >
        <div class="here2">
            <h1 style="color: black; ba " >Contact Us.. </h1>
            <h2>How we can help you ?</h2>
        </div>
        <div class="card-contact">
            <div class="form-image">
                <!-- Image -->
                <img src="about-banner.png" alt="Contact Image">
            </div>
            <div class="form-content">

                <!-- Contact Form -->
                <form action="SendEmailServlet" method="POST">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone No.:</label>
                        <input type="tel" id="phone" name="contactNo" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message:</label>
                        <textarea id="message" name="message" rows="4" required></textarea>
                    </div>
                    <button class="button1" type="submit" value="Send" >Submit</button>
                </form>
            </div>
        </div>
    </section>


    <!-- footer -->


    <div class="pg-footer">
        <footer class="footer">
            <svg class="footer-wave-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 100" preserveAspectRatio="none">
            <path class="footer-wave-path" d="M851.8,100c125,0,288.3-45,348.2-64V0H0v44c3.7-1,7.3-1.9,11-2.9C80.7,22,151.7,10.8,223.5,6.3C276.7,2.9,330,4,383,9.8 c52.2,5.7,103.3,16.2,153.4,32.8C623.9,71.3,726.8,100,851.8,100z"></path>
            </svg>
            <div class="footer-content">
                <div class="footer-content-column">
                    <div class="footer-logo">
                        <a class="footer-logo-link" href="#">
                            <span class="hidden-link-text">LOGO</span>
                            <h1><img class="Main1" src="Main.png" alt="LOGO"></h1>
                        </a>
                    </div>
                    <div class="footer-menu">
                        <h2 class="footer-menu-name"> Get Started</h2>
                        <ul id="menu-get-started" class="footer-menu-list">
                            <li class="menu-item menu-item-type-post_type menu-item-object-product">
                                <a href="#">Start</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-product">
                                <a href="#">Documentation</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-product">
                                <a href="#">Installation</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-content-column">
                    <div class="footer-menu">
                        <h2 class="footer-menu-name"> Company</h2>
                        <ul id="menu-company" class="footer-menu-list">
                            <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                <a href="#">Contact</a>
                            </li>
                            <li class="menu-item menu-item-type-taxonomy menu-item-object-category">
                                <a href="#">News</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                <a href="#">Careers</a>
                            </li>
                        </ul>
                    </div>
                    <div class="footer-menu">
                        <h2 class="footer-menu-name"> Legal</h2>
                        <ul id="menu-legal" class="footer-menu-list">
                            <li class="menu-item menu-item-type-post_type menu-item-object-page menu-item-privacy-policy menu-item-170434">
                                <a href="#">Privacy Notice</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                <a href="#">Terms of Use</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-content-column">
                    <div class="footer-menu">
                        <h2 class="footer-menu-name"> Quick Links</h2>
                        <ul id="menu-quick-links" class="footer-menu-list">
                            <li class="menu-item menu-item-type-custom menu-item-object-custom">
                                <a target="_blank" rel="noopener noreferrer" href="#">Support Center</a>
                            </li>
                            <li class="menu-item menu-item-type-custom menu-item-object-custom">
                                <a target="_blank" rel="noopener noreferrer" href="#">Service Status</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                <a href="#">Security</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                <a href="#">Blog</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type_archive menu-item-object-customer">
                                <a href="#">Customers</a>
                            </li>
                            <li class="menu-item menu-item-type-post_type menu-item-object-page">
                                <a href="#">Reviews</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="footer-content-column">
                    <div class="footer-call-to-action">
                        <h2 class="footer-call-to-action-title"> Let's Chat</h2>
                        <p class="footer-call-to-action-description"> Have a support question?</p>
                        <a class="footer-call-to-action-button button" href="#" target="_self"> Get in Touch </a>
                    </div>
                    <div class="footer-call-to-action">
                        <h2 class="footer-call-to-action-title"> You Call Us</h2>
                        <p class="footer-call-to-action-link-wrapper"> <a class="footer-call-to-action-link" href="tel:0124-64XXXX" target="_self"> 0124-64XXXX </a></p>
                    </div>
                </div>
                <div class="footer-social-links"> <svg class="footer-social-amoeba-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 236 54">
                    <path class="footer-social-amoeba-path" d="M223.06,43.32c-.77-7.2,1.87-28.47-20-32.53C187.78,8,180.41,18,178.32,20.7s-5.63,10.1-4.07,16.7-.13,15.23-4.06,15.91-8.75-2.9-6.89-7S167.41,36,167.15,33a18.93,18.93,0,0,0-2.64-8.53c-3.44-5.5-8-11.19-19.12-11.19a21.64,21.64,0,0,0-18.31,9.18c-2.08,2.7-5.66,9.6-4.07,16.69s.64,14.32-6.11,13.9S108.35,46.5,112,36.54s-1.89-21.24-4-23.94S96.34,0,85.23,0,57.46,8.84,56.49,24.56s6.92,20.79,7,24.59c.07,2.75-6.43,4.16-12.92,2.38s-4-10.75-3.46-12.38c1.85-6.6-2-14-4.08-16.69a21.62,21.62,0,0,0-18.3-9.18C13.62,13.28,9.06,19,5.62,24.47A18.81,18.81,0,0,0,3,33a21.85,21.85,0,0,0,1.58,9.08,16.58,16.58,0,0,1,1.06,5A6.75,6.75,0,0,1,0,54H236C235.47,54,223.83,50.52,223.06,43.32Z"></path>
                    </svg>
                    <a class="footer-social-link linkedin" href="#" target="_blank">
                        <span class="hidden-link-text">Linkedin</span>
                        <svg class="footer-social-icon-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30">
                        <path class="footer-social-icon-path" d="M9,25H4V10h5V25z M6.501,8C5.118,8,4,6.879,4,5.499S5.12,3,6.501,3C7.879,3,9,4.121,9,5.499C9,6.879,7.879,8,6.501,8z M27,25h-4.807v-7.3c0-1.741-0.033-3.98-2.499-3.98c-2.503,0-2.888,1.896-2.888,3.854V25H12V9.989h4.614v2.051h0.065 c0.642-1.18,2.211-2.424,4.551-2.424c4.87,0,5.77,3.109,5.77,7.151C27,16.767,27,25,27,25z"></path>
                        </svg>
                    </a>
                    <a class="footer-social-link twitter" href="#" target="_blank">
                        <span class="hidden-link-text">Twitter</span>
                        <svg class="footer-social-icon-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 26 26">
                        <path class="footer-social-icon-path" d="M 25.855469 5.574219 C 24.914063 5.992188 23.902344 6.273438 22.839844 6.402344 C 23.921875 5.75 24.757813 4.722656 25.148438 3.496094 C 24.132813 4.097656 23.007813 4.535156 21.8125 4.769531 C 20.855469 3.75 19.492188 3.113281 17.980469 3.113281 C 15.082031 3.113281 12.730469 5.464844 12.730469 8.363281 C 12.730469 8.773438 12.777344 9.175781 12.867188 9.558594 C 8.503906 9.339844 4.636719 7.246094 2.046875 4.070313 C 1.59375 4.847656 1.335938 5.75 1.335938 6.714844 C 1.335938 8.535156 2.261719 10.140625 3.671875 11.082031 C 2.808594 11.054688 2 10.820313 1.292969 10.425781 C 1.292969 10.449219 1.292969 10.46875 1.292969 10.492188 C 1.292969 13.035156 3.101563 15.15625 5.503906 15.640625 C 5.0625 15.761719 4.601563 15.824219 4.121094 15.824219 C 3.78125 15.824219 3.453125 15.792969 3.132813 15.730469 C 3.800781 17.8125 5.738281 19.335938 8.035156 19.375 C 6.242188 20.785156 3.976563 21.621094 1.515625 21.621094 C 1.089844 21.621094 0.675781 21.597656 0.265625 21.550781 C 2.585938 23.039063 5.347656 23.90625 8.3125 23.90625 C 17.96875 23.90625 23.25 15.90625 23.25 8.972656 C 23.25 8.742188 23.246094 8.515625 23.234375 8.289063 C 24.261719 7.554688 25.152344 6.628906 25.855469 5.574219 "></path>
                        </svg>
                    </a>
                    <a class="footer-social-link youtube" href="#" target="_blank">
                        <span class="hidden-link-text">Youtube</span>
                        <svg class="footer-social-icon-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 30 30">
                        <path class="footer-social-icon-path" d="M 15 4 C 10.814 4 5.3808594 5.0488281 5.3808594 5.0488281 L 5.3671875 5.0644531 C 3.4606632 5.3693645 2 7.0076245 2 9 L 2 15 L 2 15.001953 L 2 21 L 2 21.001953 A 4 4 0 0 0 5.3769531 24.945312 L 5.3808594 24.951172 C 5.3808594 24.951172 10.814 26.001953 15 26.001953 C 19.186 26.001953 24.619141 24.951172 24.619141 24.951172 L 24.621094 24.949219 A 4 4 0 0 0 28 21.001953 L 28 21 L 28 15.001953 L 28 15 L 28 9 A 4 4 0 0 0 24.623047 5.0546875 L 24.619141 5.0488281 C 24.619141 5.0488281 19.186 4 15 4 z M 12 10.398438 L 20 15 L 12 19.601562 L 12 10.398438 z"></path>
                        </svg>
                    </a>
                    <a class="footer-social-link github" href="#" target="_blank">
                        <span class="hidden-link-text">Github</span>
                        <svg class="footer-social-icon-svg" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 32">
                        <path class="footer-social-icon-path" d="M 16 4 C 9.371094 4 4 9.371094 4 16 C 4 21.300781 7.4375 25.800781 12.207031 27.386719 C 12.808594 27.496094 13.027344 27.128906 13.027344 26.808594 C 13.027344 26.523438 13.015625 25.769531 13.011719 24.769531 C 9.671875 25.492188 8.96875 23.160156 8.96875 23.160156 C 8.421875 21.773438 7.636719 21.402344 7.636719 21.402344 C 6.546875 20.660156 7.71875 20.675781 7.71875 20.675781 C 8.921875 20.761719 9.554688 21.910156 9.554688 21.910156 C 10.625 23.746094 12.363281 23.214844 13.046875 22.910156 C 13.15625 22.132813 13.46875 21.605469 13.808594 21.304688 C 11.144531 21.003906 8.34375 19.972656 8.34375 15.375 C 8.34375 14.0625 8.8125 12.992188 9.578125 12.152344 C 9.457031 11.851563 9.042969 10.628906 9.695313 8.976563 C 9.695313 8.976563 10.703125 8.65625 12.996094 10.207031 C 13.953125 9.941406 14.980469 9.808594 16 9.804688 C 17.019531 9.808594 18.046875 9.941406 19.003906 10.207031 C 21.296875 8.65625 22.300781 8.976563 22.300781 8.976563 C 22.957031 10.628906 22.546875 11.851563 22.421875 12.152344 C 23.191406 12.992188 23.652344 14.0625 23.652344 15.375 C 23.652344 19.984375 20.847656 20.996094 18.175781 21.296875 C 18.605469 21.664063 18.988281 22.398438 18.988281 23.515625 C 18.988281 25.121094 18.976563 26.414063 18.976563 26.808594 C 18.976563 27.128906 19.191406 27.503906 19.800781 27.386719 C 24.566406 25.796875 28 21.300781 28 16 C 28 9.371094 22.628906 4 16 4 Z "></path>
                        </svg>
                    </a>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="footer-copyright-wrapper">
                    <p class="footer-copyright-text">
                        <a class="footer-copyright-link" href="#" target="_self"> ©2024. | Designed By: Pappu Sah. | All rights reserved. </a>
                    </p>
                </div>
            </div>
        </footer>
    </div>











    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="script.js"></script>
</body>

</html>