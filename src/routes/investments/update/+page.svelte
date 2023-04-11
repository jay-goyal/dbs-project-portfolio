<script lang="ts">
  import { enhance } from '$app/forms';
</script>

<form method="POST" action="?/update" use:enhance>
  <label for="investmentID">Investment ID</label>
  <input type="number" name="investmentID" placeholder="Investment ID" required />
  <label for="numShares">Number of Shares</label>
  <input type="number" name="numShares" placeholder="Number of Shares" required />
  <button class="contrast" type="submit">Update Investment</button>
</form>
