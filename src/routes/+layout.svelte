<script lang="ts">
  import '@picocss/pico';
  import '../app.css';
  export let data;
</script>

<nav>
  <ul />
  <ul>
    <li><a href="/"><h1>Portfolio Management System</h1></a></li>
  </ul>
  <ul />
</nav>

<main class="container">
  {#if data.dbConnected}
    <slot />
  {:else}
    <h1 class="del">UPDATE DATABASE CREDENTIALS</h1>
  {/if}
</main>

<style>
  nav * {
    --typography-spacing-vertical: 0 !important;
  }

  nav {
    padding: 0 20px;
  }
</style>
