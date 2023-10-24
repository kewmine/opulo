<script>
    import Colors_table from "$lib/modules/colors_table.svelte";
    import Footer from "$lib/modules/footer.svelte";
    import Nav from "$lib/modules/nav.svelte";
</script>

<section class="display">
    <div class="name">OPULO</div>
    <div class="desc">colors to <span class="sanity">protect your sanity</span> while debugging</div>

    <Nav/>
</section>

<section>
    <Colors_table/>
    <Footer/>
</section>

<style lang="scss">
  @import "$lib/modules/theme";
  @import url('https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap');

  .sanity {
    color: $color_12;
  }

  section {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  .display {
    padding-bottom: 10vh;
  }

  .name {
    --bg-size: 400%;
    font-size: clamp(3rem, 25vmin, 8rem);
    font-family: "Raleway", monospace;
    font-weight: 700;
    background: linear-gradient(
                    90deg,
                    $snow,
                    $sakura, $clouds, $shark, $washed,
                    $snow,
    ) 0 0 / var(--bg-size) 100%;
    color: transparent;
    background-clip: text;
    -webkit-background-clip: text;
    animation: move-bg 8s infinite linear;
  }

  .desc {
    color: $color_02;
    font-family: "Roboto", monospace;
    font-weight: 400;
    font-size: 2.2vh;
  }

  @keyframes move-bg {
    to {
      background-position: var(--bg-size) 0;
    }
  }

</style>