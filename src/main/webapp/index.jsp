<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Flipkart - Demo E-commerce</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    :root{
      --brand:#2874f0; /* flipkart-like blue */
      --muted:#6b7280;
      --card:#ffffff;
      --bg:#f5f7fb;
      --radius:10px;
      font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }
    *{box-sizing:border-box}
    body{margin:0;background:var(--bg);color:#111}
    header{background:linear-gradient(90deg,var(--brand),#1e63d6);color:#fff;padding:14px 20px;display:flex;align-items:center;gap:20px;position:sticky;top:0;z-index:50;box-shadow:0 2px 6px rgba(0,0,0,0.08)}
    .brand{font-weight:700;font-size:22px;letter-spacing:0.4px}
    .search {
      flex:1; display:flex; align-items:center; gap:8px;
      background: #fff; padding:6px; border-radius:6px; max-width:720px;
    }
    .search input{flex:1;border:0;outline:none;padding:8px 10px;font-size:14px;border-radius:6px}
    .search button{background:var(--brand);color:#fff;border:0;padding:8px 12px;border-radius:6px;cursor:pointer}
    nav{display:flex;gap:14px;align-items:center}
    .cart-btn{background:rgba(255,255,255,0.12);padding:8px 10px;border-radius:6px;color:#fff;cursor:pointer}
    main{padding:24px;max-width:1200px;margin:20px auto}
    .hero{display:flex;gap:20px;align-items:center;justify-content:space-between;margin-bottom:20px}
    .hero .left{flex:1}
    .hero h1{margin:0;font-size:28px}
    .hero p{color:var(--muted);margin-top:8px}
    .hero .cta{margin-top:12px;padding:10px 14px;background:var(--brand);color:#fff;border:0;border-radius:8px;cursor:pointer}
    .grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(220px,1fr));gap:16px}
    .card{background:var(--card);padding:12px;border-radius:12px;box-shadow:0 6px 16px rgba(17,24,39,0.06);display:flex;flex-direction:column;gap:10px}
    .card img{width:100%;height:160px;object-fit:cover;border-radius:8px;background:#eee}
    .title{font-weight:600;font-size:14px}
    .price{color:var(--brand);font-weight:700}
    .actions{display:flex;gap:8px;margin-top:auto}
    .btn{flex:1;padding:8px 10px;border-radius:8px;border:0;cursor:pointer}
    .btn.primary{background:var(--brand);color:#fff}
    .btn.ghost{background:#f1f5f9;border:1px solid #e6eefc}
    footer{margin-top:30px;padding:20px;text-align:center;color:var(--muted)}
    .topbar{display:flex;gap:12px;align-items:center}
    .badge{background:#fff;border-radius:20px;padding:6px 10px;color:var(--brand);font-weight:600}
    /* cart drawer */
    .drawer{position:fixed;right:16px;top:72px;width:340px;background:#fff;border-radius:12px;box-shadow:0 12px 40px rgba(2,6,23,0.16);padding:12px;max-height:70vh;overflow:auto;display:none}
    .drawer.open{display:block}
    .cart-item{display:flex;gap:8px;align-items:center;padding:8px 0;border-bottom:1px dashed #eee}
    .cart-item img{width:56px;height:56px;object-fit:cover;border-radius:8px}
    .cart-footer{display:flex;justify-content:space-between;align-items:center;margin-top:12px}
    /* responsive */
    @media(max-width:720px){header{flex-wrap:wrap}.hero{flex-direction:column;align-items:flex-start}.drawer{right:8px;width:92%}}
  </style>
</head>
<body>

<header>
  <div class="brand">Flipkart</div>
  <div class="search" role="search" aria-label="Search products">
    <input id="searchInput" type="search" placeholder="Search for products, brands and more..." />
    <button id="searchBtn">Search</button>
    <input id="Nisha_Gupta" type="search" placeholder="Search for products, brands and more..." />
    <input id="shraddha_gupta" type="search" placeholder="Search for products, brands and more..." />
    <input id="kanhaiya_gupta" type="search" placeholder="Search for products, brands and more..." />
    <input id="shraddha_gupta" type="search" placeholder="Search for products and get big discount and kanhaiya bhaiya bhai aya kanhaiya radha rani, brands and more..." />
      <input id="kanhaiya_gupta" type="search" placeholder="radhe tradhe radhe rahe radhe radhe radhe radhe radhe" />
  </div>
  <nav>

	 <div class="topbar">
      <div class="badge">Free Delivery</div>
    </div>
    <div class="cart-btn" id="openCart">Cart (<span id="cartCount">0</span>)</div>
  </nav>
</header>

<main>
  <section class="hero">
    <div class="left">
      <h1>Popular deals on electronics, fashion & more</h1>
      <p>Demo e-commerce landing page — responsive and interactive. Use it for practice projects & portfolio.</p>
      <button class="cta" onclick="scrollToProducts()">Shop Now</button>
    </div>
    <div class="right">
      <img src="https://images.unsplash.com/photo-1545239351-1141bd82e8a6?q=80&w=700&auto=format&fit=crop&ixlib=rb-4.0.3&s=5b5b8a1f2b7a8a7f6a2b9b3161c9b4ba" alt="hero" style="width:320px;border-radius:12px;box-shadow:0 10px 30px rgba(2,6,23,0.08)">
    </div>
  </section>

  <section>
    <h2 style="margin:0 0 10px 0">Products</h2>
    <div class="grid" id="productsGrid">
      <!-- product cards inserted by JS -->
    </div>
  </section>

  <section style="margin-top:22px">
    <h3>Contact / Join</h3>
    <form id="contactForm" style="display:flex;flex-direction:column;gap:8px;max-width:480px;">
      <input id="name" placeholder="Your name" style="padding:10px;border-radius:8px;border:1px solid #e6eefc" required>
      <input id="email" placeholder="Email" style="padding:10px;border-radius:8px;border:1px solid #e6eefc" required>
      <textarea id="message" placeholder="Message" rows="4" style="padding:10px;border-radius:8px;border:1px solid #e6eefc"></textarea>
      <button class="cta" type="submit" style="width:140px">Send</button>
    </form>
  </section>
</main>

<!-- cart drawer -->
<div class="drawer" id="cartDrawer" aria-hidden="true">
  <h4 style="margin:0 0 8px 0">Your Cart</h4>
  <div id="cartItems"></div>
  <div class="cart-footer">
    <div><strong>Total:</strong> ₹<span id="cartTotal">0</span></div>
    <button class="btn primary" id="checkoutBtn">Checkout</button>
  </div>
</div>

<footer>
  &copy; Demo project — Flipkart (for training only). Built with ❤️ for learning.
</footer>

<script>
  // Demo products (you can replace images/labels)
  const PRODUCTS = [
    {id:1, title:"Smartphone XR - 6.5\" Display", price:11999, img:"https://images.unsplash.com/photo-1510557880182-3d4d3b3d3f33?q=80&w=700&auto=format&fit=crop&ixlib=rb-4.0.3&s=ae1b5b9d2b6b3a8b1ea9f1e2c3d4e5f6"},
    {id:2, title:"Wireless Headphones Pro", price:2999, img:"https://images.unsplash.com/photo-1518444023010-8fd00f1f5e4f?q=80&w=700&auto=format&fit=crop&ixlib=rb-4.0.3&s=f3a5d6f7e8d9c0b1a2e3f4d5"},
    {id:3, title:"Smartwatch Series 4", price:8999, img:"https://images.unsplash.com/photo-1516579480488-29aef5b5a29b?q=80&w=700&auto=format&fit=crop&ixlib=rb-4.0.3&s=2b2f3d4e5f6a7b8c9d0e1f2a"},
    {id:4, title:"Bluetooth Speaker", price:1499, img:"https://images.unsplash.com/photo-1503602642458-232111445657?q=80&w=700&auto=format&fit=crop&ixlib=rb-4.0.3&s=c7a8b9d0e1f2a3b4c5d6e7f8"},

