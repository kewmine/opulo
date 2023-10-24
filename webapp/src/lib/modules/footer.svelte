<script>
    import Michi from "$lib/static/michi.gif"
    import Data from '../../data.json';
</script>

<div id="footer">

    <img class="michi" src="{Michi}" alt="michi"/>
    <hr>
    <div id="content">
        <div class="copyright"> Copyright © 2023</div>
        <a href="https://{Data['domain']}">{Data["domain"]} </a>
        <div id="divider">|</div>
        <a class="legal" href="https://kew.bio/legal"> LEGAL </a>
    </div>
</div>


<style lang="scss">
  @import "theme";

  .copyright {
    padding-right: 1vh;
  }

  hr {
    padding: 0;
    margin: 0 0 1vh 0;
  }

  #footer {
    width: 35vh;
    padding: 2vh 0 4vh 0;
    color: $color_02;
    font-family: "IBM Plex Mono", monospace;
    font-weight: 400;
    font-size: 1.3vh;
  }

  #content {
    display: flex;
    justify-content: center;
    align-items: center;
    align-self: center;

    #divider {
      padding: 0 1.5vh 0 1.5vh;
    }
  }

  .michi {
    width: 10vh;
    user-select: none;
    pointer-events: none;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    -webkit-user-drag: none;
    -o-user-select: none;
  }

</style>