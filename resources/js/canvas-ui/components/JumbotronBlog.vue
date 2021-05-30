<template>
	<div>	

		<!-- //JUMBOTRON -->
			<!-- //JUMBOTRON - Container -->
			<div style="background-color:lightblue;" class="jumbotronContainer" id="jumbotronContainer">
				<div class="jumbotronContainerBefore" id="jumbotronContainerBefore"></div>
				<div class="container-fluid">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							
							<!-- //JUMBOTRON - Header -->
							<header class="jumbotronHeader">
								
								<!-- //JUMBOTRON - Category -->
								<small style="font-size: 1em" class="jumbotronCategory" id="jumbotronCategory">
									Ayocode
								</small>
								<!-- JUMBOTRON - Category// -->
								
								<!-- //JUMBOTRON - Title -->
								<h1 class="jumbotronTitle" id="jumbotronTitle">
									Blogs
								</h1>
								<!-- JUMBOTRON - Title// -->

							</header>
							<!-- JUMBOTRON - Header// -->
							
							<!-- //JUMBOTRON - Body -->
							<div style="margin-top:-30px" class="jumbotronBody" id="jumbotronBody">
								<p>
									Let's code the world..
								</p>
								<p>
									Date : <span id="date"></span> <br />
									Time : <span id="time"></span>
								</p>
							</div>
							<!-- JUMBOTRON - Body// -->
							
							<!-- //JUMBOTRON - Footer -->
							<footer class="jumbotronFooter" id="jumbotronFooter">
								<a  class="btn btn-primary text-white" href="#popularPost" role="button">
									Popular Post<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
								</a>
								<div class="custom-shape-divider-bottom-1621734497 wave">
									<svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
										<path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
										<path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
										<path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
									</svg>
								</div>										
							</footer>
													
							<!-- JUMBOTRON - Footer// -->
						</div>
					</div>										
				</div>			
			</div>			
			<!-- JUMBOTRON - Container// -->			
		<!-- JUMBOTRON// -->
		<!-- <h1>Blogs</h1>
    	<p class="lead text-secondary">Let's code the world</p> -->
	</div>
</template>

<script>

export default {
	name: "JumbotronBlog",
	mounted() {
		let dt = new Date();
		const days = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu'];
		var dayName = days[dt.getDay()];

		document.getElementById('date').innerHTML = ((dayName)) + " " + (("0"+dt.getDate()).slice(-2)) +"-"+ (("0"+(dt.getMonth()+1)).slice(-2)) +"-"+ (dt.getFullYear());

		document.getElementById('time').innerHTML = (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
	}
}
</script>


<style scoped>
.jumbotronContainer {
	/* background-image: url('https://image.freepik.com/free-vector/tiny-developers-programming-website-internet-platform-flat-vector-illustration-cartoon-programmers-near-screen-with-open-code-script-software-development-digital-technology-concept_74855-10168.jpg');
	background-position: top right;
    background-repeat: no-repeat;
	background-size: 25vmax; */
	height: 24rem;
	
}

.jumbotronHeader {
	margin: 30px;
	
}
.jumbotronTitle {
	font-size: 4em;
	margin-left: -10px;
}

.jumbotronBody {
	margin: 30px;
}

.jumbotronFooter {
	height: 8rem;
	margin: 30px;
	margin-top: -15px;
}

.custom-shape-divider-bottom-1621734497 {
	position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    overflow: hidden;
    line-height: 0;
    transform: rotate(180deg);
}

.custom-shape-divider-bottom-1621734497 svg {
    position: relative;
    display: flex;
    width: calc(119% + 1.3px);
    height: 100px;
}

.custom-shape-divider-bottom-1621734497 .shape-fill {
    fill: #FFFFFF;
}

</style>