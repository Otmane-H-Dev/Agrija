<!-- Meta Tag -->
@yield('meta')
<meta name="description" content="@yield('description', 'Agrija is Morocco\'s premier B2B platform for bulk agricultural trade. Connect with wholesale suppliers for premium produce, vegetables, and export-grade goods.')">
<meta name="keywords" content="@yield('keywords', 'wholesale fruits vegetables, moroccan produce, wholesale african food, fresh produce suppliers, bulk fruits vegetables, wholesale prices')">

<!-- Open Graph Meta Tags -->
<meta property="og:type" content="website">
<meta property="og:url" content="https://agrija.site/product-grids">
<meta property="og:title" content="Agrija | B2B Bulk Agricultural Trade Morocco">
<meta property="og:description" content="Direct wholesale access to premium Moroccan produce and agricultural exports. Secure RFQ system for bulk buyers.">
<meta property="og:image" content="https://agrija.site/img/agrija.png">

<!-- Twitter Meta Tags -->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:title" content="Agrija | B2B Bulk Agricultural Trade">
<meta property="twitter:description" content="Direct wholesale access to premium Moroccan produce.">
<meta property="twitter:image" content="https://agrija.site/img/agrija.png">

<!-- Title Tag  -->
<title>@yield('title')</title>
<!-- Favicon -->
<link rel="icon" type="image/png" href="images/favicon.png">
<!-- Web Font -->
<link href="https://fonts.googleapis.com/css?family=Poppins:200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

<!-- StyleSheet -->
<link rel="manifest" href="/manifest.json">
<!-- Bootstrap -->
<link rel="stylesheet" href="{{asset('frontend/css/bootstrap.css')}}">
<!-- Magnific Popup -->
<link rel="stylesheet" href="{{asset('frontend/css/magnific-popup.min.css')}}">
<!-- Font Awesome -->
<link rel="stylesheet" href="{{asset('frontend/css/font-awesome.css')}}">
<!-- Fancybox -->
<link rel="stylesheet" href="{{asset('frontend/css/jquery.fancybox.min.css')}}">
<!-- Themify Icons -->
<link rel="stylesheet" href="{{asset('frontend/css/themify-icons.css')}}">
<!-- Nice Select CSS -->
<link rel="stylesheet" href="{{asset('frontend/css/niceselect.css')}}">
<!-- Animate CSS -->
<link rel="stylesheet" href="{{asset('frontend/css/animate.css')}}">
<!-- Flex Slider CSS -->
<link rel="stylesheet" href="{{asset('frontend/css/flex-slider.min.css')}}">
<!-- Owl Carousel -->
<link rel="stylesheet" href="{{asset('frontend/css/owl-carousel.css')}}">
<!-- Slicknav -->
<link rel="stylesheet" href="{{asset('frontend/css/slicknav.min.css')}}">
<!-- Jquery Ui -->
<link rel="stylesheet" href="{{asset('frontend/css/jquery-ui.css')}}">

<!-- Eshop StyleSheet -->
<link rel="stylesheet" href="{{asset('frontend/css/reset.css')}}">
<link rel="stylesheet" href="{{asset('frontend/css/style.css')}}">
<link rel="stylesheet" href="{{asset('frontend/css/responsive.css')}}">
<style>
    /* Multilevel dropdown */
    .dropdown-submenu {
    position: relative;
    }

    .dropdown-submenu>a:after {
    content: "\f0da";
    float: right;
    border: none;
    font-family: 'FontAwesome';
    }

    .dropdown-submenu>.dropdown-menu {
    top: 0;
    left: 100%;
    margin-top: 0px;
    margin-left: 0px;
    }

    /*
</style>
@stack('styles')
