<script lang="ts">
  import { enhance } from '$app/forms';
</script>

<form method="POST" action="?/delete" use:enhance>
  <label for="investmentID">Investment ID</label>
  <input type="name" name="investmentID" placeholder="Investment ID" required />
  <button class="contrast" type="submit">Delete</button>
</form>
