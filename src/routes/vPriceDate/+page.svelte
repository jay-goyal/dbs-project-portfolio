<script lang="ts">
  import Table from '../../components/Table.svelte';
  import type ObjArr from '../../types/ObjArr';
  let date = new Date().toDateString();
  let data: ObjArr = [];
  let dispTable = false;

  async function handleSubmit() {
    const res = await fetch('/vPriceDate/submit', {
      method: 'POST',
      body: JSON.stringify({ date }),
      headers: {
        'Content-Type': 'application/json'
      }
    });
    const { result } = await res.json();
    data = result;
    dispTable = true;
  }
</script>

<form on:submit|preventDefault={handleSubmit}>
  <label for="date">Date to Check For</label>
  <input type="date" name="date" placeholder="Date to Check For" required bind:value={date} />
  <button class="contrast" type="submit">Check Records</button>
</form>
{#if dispTable}
  <Table {data} />
{/if}
