<script lang="ts">
  import { enhance } from '$app/forms';
</script>

<form method="POST" action="?/add" use:enhance>
  <div class="grid">
    <label for="investorID">
      Investor ID
      <input type="number" name="investorID" placeholder="Investor ID" required />
    </label>
    <label for="stockID">
      Stock ID
      <input type="number" name="stockID" placeholder="Stock ID" required />
    </label>
  </div>
  <div class="grid">
    <label for="doi">
      Date of Investment
      <input type="date" name="doi" placeholder="Date of Investment" required />
    </label>
    <label for="nos">
      Number of Shares
      <input type="number" name="nos" placeholder="Number of Shares" required />
    </label>
  </div>

  <div class="grid">
    <label for="toi">
      Type of Investment
      <input
        type="text"
        name="toi"
        pattern="(Stock|Bond)"
        placeholder="Type of Investment"
        required
      />
    </label>
    <div />
  </div>
  <div class="grid">
    <button class="contrast" type="submit">Add Investment</button>
    <div />
  </div>
</form>

<style>
  form {
    width: 100%;
  }
</style>
