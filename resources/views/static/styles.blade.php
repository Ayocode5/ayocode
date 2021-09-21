<style>
    @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");

    * {
        margin: 0;
        padding: 0;
    }

    body {
        font-family: "Poppins", sans-serif;
    }

    /* Navbar */
    .my-navbar {
        font-weight: bold;
        font-size: 18px;
        background: rgba(77, 77, 77, 0.5);
        backdrop-filter: blur(5px);
    }

    .bck-nav {
        background-color: #3f3653 !important;
    }

    .my-navbar .nav-brand-ayocode {
        width: 50px;
    }

    .my-btn {
        color: white;
        border-radius: 10px;
        background: #3e3354;
        border: solid 2px #ffffff;
    }

    .my-navbar .contact-btn:hover {
        background: #896fbc;
    }

    /* End of Navbar */

    /* Jumbotron */
    .my-jumbotron {
        background-image: url(./storage/images/content/2.jpg);
        background-size: cover;
        height: 600px;
        background-repeat: no-repeat;
        background-position: center;
        text-align: center;
        color: white;
    }

    .my-jumbotron .jumbotron-content>h1>span {
        font-weight: 800;
    }

    .jumbotron-content>h1 {
        position: relative;
        z-index: 2;
    }

    .my-jumbotron .jumbotron-content {
        margin-top: 180px;
        font-weight: 500;
        font-size: 28rem;
        text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.7);
        margin-bottom: 30px;
    }

    .rectangle-utility {
        width: 300px;
        margin-top: -30px;
        margin-left: -115px;
        position: absolute;
        z-index: 1;
    }

    /* End of Jumbotron */

    /* About */
    #about {
        background-color: #3e3354;
        position: relative;
    }

    #about .text-about {
        position: relative;
        z-index: 2;
    }

    .rectangle-utility2 {
        width: 100px;
        margin-top: -25px;
        margin-left: -34px;
        position: absolute;
        z-index: 1;
    }

    #about .my-circle1 {
        position: absolute;
        left: 0;
        bottom: 0;
        padding-bottom: 15px;
    }

    #about .my-circle2 {
        position: absolute;
        right: 0;
        top: 0;
        padding-top: 15px;
    }

    /* End About */

    /* Services */
    #services {
        background-color: #7d2670;
    }

    .text-services {
        position: relative;
        z-index: 2;
    }

    .my-card-service {
        border: none;
        background-color: #3e3354;
        box-shadow: 1px 1px 7px rgba(0, 0, 0, 0.5);
        position: relative;
    }

    .icon1 {
        width: 35px;
    }

    .rectangle-utility3 {
        width: 190px;
        margin-top: -25px;
        margin-left: -60px;
        position: absolute;
        z-index: 1;
    }

    .gelombang1 {
        width: 70px;
        margin-top: -130px;
        left: 0;
        margin-left: -30px;
        position: absolute;
    }

    .gelombang2 {
        width: 7;
        margin-top: 20px;
        right: 0;
        margin-right: 5px;
        position: absolute;
    }

    .paragraf1 {
        position: relative;
    }

    /* Our Projects */
    #project {
        background-color: #3e3354;
        width: 100%;
        height: 100%;
        position: relative;
        z-index: 3;
    }

    .rectangle4 {
        width: 150px;
        height: 20px;
        margin-top: 20px;
        margin-left: 50px;
        position: absolute;
        z-index: 1;
    }

    #scrollspyHeading4 {
        position: relative;
        z-index: 3;
    }

    .carousel-control-prev-icon {
        background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%233e3354' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
        height: 20px;
        width: 20px;
    }

    .carousel-control-next-icon {
        background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%233e3354' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;
        height: 20px;
        width: 20px;
    }

    .carousel-indicators {
        bottom: -50px;
    }

    .carousel-inner {
        position: relative;
        z-index: 1;
    }

    .carousel-caption {
        left: 0;
        bottom: 0;
        background-color: #3e3354;
        width: 300px;
        height: 100px;
    }

    .textcarousel {
        padding-left: 30px;
    }

    .circle3 {
        width: 50px;
        left: 0;
        margin-left: -20px;
        top: 0;
        margin-top: 100px;
        position: absolute;
        z-index: -1;
    }

    .circle4 {
        width: 50px;
        right: 0;
        margin-right: -20px;
        bottom: 50px;
        position: absolute;
        z-index: -1;
    }

    .hovereffect {
        width: 100%;
        height: 100%;
        float: left;
        overflow: hidden;
        position: relative;
        cursor: default;
    }

    .hovereffect .overlay {
        width: 100%;
        height: 100%;
        position: absolute;
        overflow: hidden;
        top: 0;
        left: 0;
    }

    .hovereffect img {
        display: block;
        position: relative;
        -webkit-transition: all 0.4s ease-in;
        transition: all 0.4s ease-in;
    }

    .hovereffect:hover img {
        -webkit-transform: scale(1.2);
        -ms-transform: scale(1.2);
        transform: scale(1.2);
    }

    .hovereffect:hover .overlay {
        background-color: rgba(167, 101, 157, 0.4);
    }

    .hovereffect h5 {
        padding-top: 100px;
        top: 0;
        font-weight: bold;
        text-transform: uppercase;
    }

    .hovereffect p.info {
        padding-bottom: 100px;
        bottom: 0;
        background-color: transparent;
        font-weight: bold;
        text-transform: uppercase;
    }

    .hovereffect p.info,
    .hovereffect h5 {
        -webkit-transform: scale(0.7);
        -ms-transform: scale(0.7);
        transform: scale(0.7);
        -webkit-transition: all 0.4s ease-in;
        transition: all 0.4s ease-in;
        opacity: 0;
        filter: alpha(opacity=0);
    }

    .hovereffect:hover p.info,
    .hovereffect:hover h5 {
        opacity: 1;
        filter: alpha(opacity=100);
        -webkit-transform: scale(1);
        -ms-transform: scale(1);
        transform: scale(1);
    }

    /* Section Contact */
    #contact {
        height: 420px;
        background-color: #7d2670;
        position: relative;
        z-index: 1;
    }

    .rectangle5 {
        width: 250px;
        height: 20px;
        margin-top: 20px;
        margin-left: 50px;
        position: absolute;
        z-index: -1;
    }

    .ilustrasi {
        height: 300px;
        width: 300px;
        z-index: -1;
    }

    /* Section Footer */
    footer {
        background-color: #3e3354;
        margin: 0;
        padding: 0;
    }

    .bi {
        vertical-align: -.125em;
        fill: currentColor;
    }

    /* End Footer */

    @media screen and (min-width: 992px) {
        .rectangle-utility {
            width: 650px;
            margin-left: -215px;
            margin-top: -40px;
            position: absolute;
            z-index: 1;
        }
    }

</style>