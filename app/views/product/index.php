	<!-- breadcrumb-section -->
	<div class="breadcrumb-section breadcrumb-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="breadcrumb-text">
						<p>Fresh and Organic</p>
						<h1>Shop</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end breadcrumb section -->

	<!-- products -->
	<div class="product-section mt-150 mb-150">
		<div class="container">

			<div class="row">
                <div class="col-md-12">
                    <div class="product-filters">
                        <ul>
                            <li class="active" data-filter="*">Tất cả </li>
                            <li data-filter=".strawberry">Dâu</li>
                            <li data-filter=".grape">Nho</li>
                            <li data-filter=".lemon">Chanh</li>
							
                        </ul>
                    </div>
                </div>
            </div>

			
			<div id="listSP" class="row product-lists">
				<?php foreach($sp as $i): ?>
					<div class="col-lg-4 col-md-6 text-center">
						<div class="single-product-item">
							<a href="index.php?con=ProductController&act=detail&id=<?php echo $i['id']; ?>">
								<div class="product-image">
									<img src="assets/<?php echo $i['images']; ?> ?>" alt="">
								</div>
								<h3><?php echo $i['name']; ?></h3>
							</a>
							<p class="product-price"><span>Kg</span> <?php echo number_format($i['gia']); ?> đ </p>
							<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
						</div>
					</div>
				<?php endforeach; ?>

					
				
				
			</div>

			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="pagination-wrap">
						<a id="addSP" href="#" class="rounded active">Xem thêm sản phẩm</a>
						<ul>
							<li><a href="#">Trước</a></li>
							
							<?php for($i = 1; $i <= $TongSoTrang; $i++): ?>
							<li>
								<a class="<?php echo ($i==$trang?'active':'') ?> rounded"
								 href="http://php2.test/KT/index.php?con=ProductController&act=index&cat=<?php echo $cat; ?>&p=<?php echo $i; ?>">
									<?php echo $i; ?>
								</a>
							</li>
							<?php endfor; ?>

							<li><a href="#">Sau</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end products -->

	 <!-- <script>
		const fortmatter = new Intl.NumberFormat('vi-VN',{
			style: 'currency',
			currency: 'VND',
		});

		let themSP = (sp = []) =>{
			let listSP = document.querySelector('#listSP');
			let html ='';
			sp.map(i => {
					html += `<div class="col-lg-4 col-md-6 text-center">
								<div class="single-product-item">
									<a href="index.php?con=ProductController&act=detail&id=${i.id}">
										<div class="product-image">
											<img src="assets/${i.images}" alt="">
										</div>
										<h3>${i.name}</h3>
									</a>
									<p class="product-price"><span>Kg</span> ${fortmatter.format( i.gia)} </p>
									<a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
								</div>
							</div>`;
			})
			listSP.innerHTML += html;
		}
		fetch('http://localhost/KT/index.php?con=ProductController&act=getSP&cat=3')
		.then(kq=>kq.json())
		.then(kq=> themSP(kq))
		.catch(e => console.log(e))
	</script>  -->