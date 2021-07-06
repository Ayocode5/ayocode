<!DOCTYPE html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8" />
    <title>Ayocode - Digital Agency</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <meta property="og:title" content="Ayocode" />
    <meta property="og:description" content="Digital Agency" />
    <meta property="og:url" content="https://ayocode.my.id" />
    <meta property="og:image" content="https://ayocode.my.id/images/content/logo.png" />

    <link rel="manifest" href="site.webmanifest" />
    <link rel="apple-touch-icon" href="images/favicon.ico" />
    <!-- Place favicon.ico in the root directory -->

    <link rel="stylesheet" href="vendor/landingpage/css/app.css" />
    <link rel="icon" href="vendor/landingpage/images/favicon.ico" />

    <meta name="theme-color" content="#000" />
    <link rel="icon" href="favicon.ico">
    <link href="vendor/landingpage/css/app.minify.css" rel="stylesheet">
</head>

<body>
    <!-- START: Nav -->
    <nav id="header" class="absolute w-full my-4">
        <div class="
					w-full
					container
					mx-auto
					flex flex-wrap
					items-center
					justify-between
					mt-0
					py-2
				">
            <div class="pl-4 flex items-center">
                <a class="w-16" href="#">
                    <img src="{{ asset('/storage/images/content/logo.png') }}" alt="ayocode logo" />
                </a>
            </div>
            <div class="block lg:hidden pr-4">
                <button id="nav-toggle" class="
							flex
							items-center
							p-1
							text-purple-500
							hover:text-gray-900
							focus:outline-none
							focus:shadow-outline
							transform
							transition
							duration-300
							ease-in-out
						">
                    <svg class="fill-current h-6 w-6" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <title>Menu</title>
                        <path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z" />
                    </svg>
                </button>
            </div>
            <div class="
						w-full
						flex-grow
						lg:flex
						lg:items-center
						lg:w-auto
						hidden
						mt-2
						lg:mt-0
						bg-purple-300
						lg:bg-transparent
						text-white
						p-4
						lg:p-0
						z-20
					" id="nav-content">
                <ul class="list-reset lg:flex justify-end flex-1 items-center">
                    <li class="mr-3">
                        <a class="inline-block py-2 px-4 text-white hover:text-underline" href="#">Projects</a>
                    </li>
                    <li class="mr-3">
                        <a class="inline-block text-white hover:text-underline py-2 px-4" href="#">About</a>
                    </li>
                    <li class="mr-3">
                        <a class="inline-block text-white hover:text-underline py-2 px-4" href="{{ url('/blog') }}">Blog</a>
                    </li>
                </ul>
                <button id="navAction" class="
							mx-auto
							lg:mx-0
							bg-purple-500
							text-white
							font-bold
							rounded-full
							mt-4
							lg:mt-0
							py-3
							px-11
							shadow
							opacity-75
							focus:outline-none
							focus:shadow-outline
							transform
							transition
							hover:bg-white
							hover:text-purple-500
							duration-300
							ease-in-out
						">
                    Contact
                </button>
            </div>
        </div>
    </nav>
    <!-- END: Nav -->

    <!-- START: Section Hero -->
    <section class="gradient">
        <div class="pt-24">
            <div class="
						container
						px-3
						mx-auto
						flex flex-wrap flex-col
						md:flex-row
						items-center
					">
                <!--Left Col-->
                <div class="
							flex flex-col
							w-full
							md:w-2/5
							justify-center
							md:items-start
							text-center
							md:text-left
						">
                    <p class="uppercase tracking-loose w-full text-white">We are</p>
                    <h1 class="my-2 text-5xl text-white font-bold leading-tight">
                        Ayocode. <br />
                        Digital Agency
                    </h1>
                    <p class="leading-normal text-2xl text-white mb-8">
                        Enjoy your business, and let us handle your websites!
                    </p>
                    <button class="
								mx-auto
								lg:mx-0
								bg-purple-500
								text-white
								hover:bg-white
								hover:text-purple-500
								rounded-full
								my-6
								py-4
								px-16
								focus:outline-none
								focus:shadow-outline
								transform
								transition
								duration-300
								ease-in-out
							">
                        Let's Chat!
                    </button>
                </div>
                <!--Right Col-->
                <div class="
							w-full
							md:w-3/5
							py-6
							text-center
							flex flex-col
							items-end
							hidden
							md:block
						">
                    <img class="w-full md:w-3/5 md:mx-6 z-20" src="{{ asset('/storage/images/content/image-hero.svg') }}" />
                </div>
            </div>
        </div>
        <div class="relative -mt-6 lg:-mt-24">
            <svg viewBox="0 0 1428 174" version="1.1" xmlns="http://www.w3.org/2000/svg"
                xmlns:xlink="http://www.w3.org/1999/xlink">
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                    <g transform="translate(-2.000000, 44.000000)" fill="#FFFFFF" fill-rule="nonzero">
                        <path
                            d="M0,0 C90.7283404,0.927527913 147.912752,27.187927 291.910178,59.9119003 C387.908462,81.7278826 543.605069,89.334785 759,82.7326078 C469.336065,156.254352 216.336065,153.6679 0,74.9732496"
                            opacity="0.100000001"></path>
                        <path
                            d="M100,104.708498 C277.413333,72.2345949 426.147877,52.5246657 546.203633,45.5787101 C666.259389,38.6327546 810.524845,41.7979068 979,55.0741668 C931.069965,56.122511 810.303266,74.8455141 616.699903,111.243176 C423.096539,147.640838 250.863238,145.462612 100,104.708498 Z"
                            opacity="0.100000001"></path>
                        <path
                            d="M1046,51.6521276 C1130.83045,29.328812 1279.08318,17.607883 1439,40.1656806 L1439,120 C1271.17211,77.9435312 1140.17211,55.1609071 1046,51.6521276 Z"
                            id="Path-4" opacity="0.200000003"></path>
                    </g>
                    <g transform="translate(-4.000000, 76.000000)" fill="#FFFFFF" fill-rule="nonzero">
                        <path
                            d="M0.457,34.035 C57.086,53.198 98.208,65.809 123.822,71.865 C181.454,85.495 234.295,90.29 272.033,93.459 C311.355,96.759 396.635,95.801 461.025,91.663 C486.76,90.01 518.727,86.372 556.926,80.752 C595.747,74.596 622.372,70.008 636.799,66.991 C663.913,61.324 712.501,49.503 727.605,46.128 C780.47,34.317 818.839,22.532 856.324,15.904 C922.689,4.169 955.676,2.522 1011.185,0.432 C1060.705,1.477 1097.39,3.129 1121.236,5.387 C1161.703,9.219 1208.621,17.821 1235.4,22.304 C1285.855,30.748 1354.351,47.432 1440.886,72.354 L1441.191,104.352 L1.121,104.031 L0.457,34.035 Z">
                        </path>
                    </g>
                </g>
            </svg>
        </div>
    </section>
    <!-- END: Section Hero -->

    <!-- START: Section About -->
    <section>
        <div class="w-full px-8 py-18">
            <div class="my-4">
                <h1 class="
							flex
							items-center
							justify-center
							font-bold
							text-3xl text-purple-500
							capitalize
							underline
						">
                    who are we?
                </h1>
                <div class="flex my-4 mx-auto md:mx-10">
                    <p class="w-full md:w-1/2 mx-2">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore obcaecati
                        perferendis sint consequatur deserunt, temporibus omnis iusto hic magnam
                        pariatur maxime, asperiores sunt vero cumque id sit totam doloremque
                        deleniti odio quibusdam et. Consequatur blanditiis, laborum voluptatum
                        quidem pariatur unde illo impedit delectus velit dicta dolores, animi
                        nulla, culpa similique deleniti autem! Aliquid quam, soluta sapiente fuga
                        nostrum provident nihil consequuntur eum voluptatum dolor! Itaque autem
                        ipsam quis rem, rerum laudantium sint architecto quasi vel maiores
                        perspiciatis expedita corrupti id inventore debitis. Consectetur, velit,
                        ratione quia harum, deleniti quisquam impedit officiis alias perspiciatis
                        laudantium omnis magnam? Dolores culpa excepturi odit?
                    </p>
                    <p class="w-full md:w-1/2 mx-2 hidden md:block">
                        Lorem ipsum dolor sit amet consectetur adipisicing elit. Labore obcaecati
                        perferendis sint consequatur deserunt, temporibus omnis iusto hic magnam
                        pariatur maxime, asperiores sunt vero cumque id sit totam doloremque
                        deleniti odio quibusdam et. Consequatur blanditiis, laborum voluptatum
                        quidem pariatur unde illo impedit delectus velit dicta dolores, animi
                        nulla, culpa similique deleniti autem! Aliquid quam, soluta sapiente fuga
                        nostrum provident nihil consequuntur eum voluptatum dolor! Itaque autem
                        ipsam quis rem, rerum laudantium sint architecto quasi vel maiores
                        perspiciatis expedita corrupti id inventore debitis. Consectetur, velit,
                        ratione quia harum, deleniti quisquam impedit officiis alias perspiciatis
                        laudantium omnis magnam? Dolores culpa excepturi odit?
                    </p>
                </div>
                <div class="flex items-center justify-center my-4">
                    <button class="bg-purple-500 text-white hover:bg-purple-600 py-3 px-6 rounded-md">
                        Read More..
                    </button>
                </div>
            </div>
        </div>
    </section>
    <!-- END: Section About -->

    <!-- START: Section Service -->
    <section>
        <div class="w-full px-8 py-18">
            <div class="my-4">
                <h1 class="
							flex
							items-center
							justify-center
							font-bold
							text-3xl text-purple-500
							capitalize
							underline
						">
                    our services
                </h1>
                <div class="flex">
                    <h1>company Profile</h1>
                    <h1>Landing Page</h1>
                    <h1>Personal Website</h1>
                    <h1>And More</h1>
                </div>
            </div>
        </div>
    </section>
    <!-- END: Section Service -->

    <!--START: Footer-->
    <footer class="gradient">
        <svg class="wave-top" viewBox="0 0 1439 147" version="1.1" xmlns="http://www.w3.org/2000/svg"
            xmlns:xlink="http://www.w3.org/1999/xlink">
            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                <g transform="translate(-1.000000, -14.000000)" fill-rule="nonzero">
                    <g class="wave" fill="#f8fafc">
                        <path
                            d="M1440,84 C1383.555,64.3 1342.555,51.3 1317,45 C1259.5,30.824 1206.707,25.526 1169,22 C1129.711,18.326 1044.426,18.475 980,22 C954.25,23.409 922.25,26.742 884,32 C845.122,37.787 818.455,42.121 804,45 C776.833,50.41 728.136,61.77 713,65 C660.023,76.309 621.544,87.729 584,94 C517.525,105.104 484.525,106.438 429,108 C379.49,106.484 342.823,104.484 319,102 C278.571,97.783 231.737,88.736 205,84 C154.629,75.076 86.296,57.743 0,32 L0,0 L1440,0 L1440,84 Z">
                        </path>
                    </g>
                    <g transform="translate(1.000000, 15.000000)" fill="#FFFFFF">
                        <g
                            transform="translate(719.500000, 68.500000) rotate(-180.000000) translate(-719.500000, -68.500000) ">
                            <path
                                d="M0,0 C90.7283404,0.927527913 147.912752,27.187927 291.910178,59.9119003 C387.908462,81.7278826 543.605069,89.334785 759,82.7326078 C469.336065,156.254352 216.336065,153.6679 0,74.9732496"
                                opacity="0.100000001"></path>
                            <path
                                d="M100,104.708498 C277.413333,72.2345949 426.147877,52.5246657 546.203633,45.5787101 C666.259389,38.6327546 810.524845,41.7979068 979,55.0741668 C931.069965,56.122511 810.303266,74.8455141 616.699903,111.243176 C423.096539,147.640838 250.863238,145.462612 100,104.708498 Z"
                                opacity="0.100000001"></path>
                            <path
                                d="M1046,51.6521276 C1130.83045,29.328812 1279.08318,17.607883 1439,40.1656806 L1439,120 C1271.17211,77.9435312 1140.17211,55.1609071 1046,51.6521276 Z"
                                opacity="0.200000003"></path>
                        </g>
                    </g>
                </g>
            </g>
        </svg>
        <section class="container mx-auto text-center py-6">
            <h1 class="w-full my-2 text-5xl font-bold leading-tight text-center text-white">
                Contact Us!
            </h1>
            <div class="w-full mb-4">
                <div class="h-1 mx-auto bg-white w-1/6 opacity-25 my-0 py-0 rounded-t"></div>
            </div>
            <h3 class="my-4 text-3xl leading-tight">
                Email : contact@ayocode.my.id <br />
                Ig : ayocode
            </h3>
        </section>
    </footer>
    <!--END: Footer-->

    <!-- Google Analytics: change UA-XXXXX-Y to be your site's ID. -->
    <script>
        window.ga = function () {
            ga.q.push(arguments);
        };
        ga.q = [];
        ga.l = +new Date();
        ga("create", "UA-XXXXX-Y", "auto");
        ga("set", "anonymizeIp", true);
        ga("set", "transport", "beacon");
        ga("send", "pageview");

    </script>
    <script src="https://www.google-analytics.com/analytics.js" async></script>
    <script src="vendor/landingpage/js/app.js"></script>
</body>

</html>
