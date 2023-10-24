<script>

</script>

<div class="colors">
    <div class="title"> MAIN ACCENT</div>
    <div class="major">
        <div class="color snow"></div>
        <div class="color sakura"></div>
        <div class="color washed"></div>
        <div class="color clouds"></div>
        <div class="color shark"></div>
        <div class="color deep"></div>
        <div class="color toxic"></div>
    </div>

    <div class="title"> EVERYTHING ELSE</div>
    <div class="minor">
        <div class="color color_01"></div>
        <div class="color color_02"></div>
        <div class="color color_03"></div>
        <div class="color color_04"></div>
        <div class="color color_05"></div>
        <div class="color color_06"></div>
        <div class="color color_07"></div>
        <div class="color color_08"></div>
    </div>

    <div class="minor">
        <div class="color color_09"></div>
        <div class="color color_10"></div>
        <div class="color color_11"></div>
        <div class="color color_12"></div>
        <div class="color color_13"></div>
    </div>

    <div class="minor">
        <div class="color color_14"></div>
        <div class="color color_15"></div>
        <div class="color color_16"></div>
        <div class="color color_17"></div>
    </div>

</div>

<style lang="scss">
  @import "$lib/modules/theme";

  .title {
    padding: 10vh 0 1vh 0;
    font-family: "Mooli", monospace;
    font-size: 1.5vh;
    letter-spacing: 1px;
    font-weight: 100;
  }

  .colors {
    width: 100vw;
    margin: 2vh 0 10vh 0;
  }

  .color {
    margin: 0.2vw;
    display: inline-flex;
    border: 3px solid $color_02;
    $size: 4vh;
    height: $size;
    width: $size;
    background-color: #118ab2;
    transition: 0.2s ease-in-out;
    border-radius: 10px;
  }

  .color:hover, .color:active {
    border: 3px solid $shark;
  }

  .major, .minor {
    padding: 2vh 0 0 0;
  }

  // major colors
  .snow {
    background-color: $snow
  }

  .sakura {
    background-color: $sakura;
  }

  .washed {
    background-color: $washed;
  }

  .clouds {
    background-color: $clouds;
  }

  .shark {
    background-color: $shark;
  }

  .deep {
    background-color: $deep;
  }

  .toxic {
    background-color: $toxic;
  }

  // all colors
  .color_01 {
    background-color: $color_01;
  }

  .color_02 {
    background-color: $color_02;
  }

  .color_03 {
    background-color: $color_03;
  }

  .color_04 {
    background-color: $color_04;
  }

  .color_05 {
    background-color: $color_05;
  }

  .color_06 {
    background-color: $color_06;
  }

  .color_07 {
    background-color: $color_07;
  }

  .color_08 {
    background-color: $color_08;
  }

  .color_09 {
    background-color: $color_09;
  }

  .color_10 {
    background-color: $color_10;
  }

  .color_11 {
    background-color: $color_11;
  }

  .color_12 {
    background-color: $color_12;
  }

  .color_13 {
    background-color: $color_13;
  }

  .color_14 {
    background-color: $color_14;
  }

  .color_15 {
    background-color: $color_15;
  }

  .color_16 {
    background-color: $color_16;
  }

  .color_17 {
    background-color: $color_17;
  }

</style>