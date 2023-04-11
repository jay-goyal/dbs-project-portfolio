<script lang="ts">
  import Table from '../../components/Table.svelte';
  import type ObjArr from '../../types/ObjArr';
  let id: number;
  let date1 = new Date().toDateString();
  let date2 = new Date().toDateString();
  let data: ObjArr = [];
  let dispTable = false;

  async function handleSubmit() {
    const res = await fetch('/percentChange/submit', {
      method: 'POST',
      body: JSON.stringify({ id, date1, date2 }),
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
  <label for="id1">Stock ID</label>
  <input type="text" name="id1" placeholder="Stock ID" required bind:value={id} />
  <label for="date1">Start Date</label>
  <input type="date" name="date1" placeholder="Start Date" required bind:value={date1} />
  <label for="date2">End Date</label>
  <input type="date" name="date2" placeholder="End Date" required bind:value={date2} />
  <button class="contrast" type="submit">Get Change</button>
</form>
{#if dispTable}
  <Table {data} />
{/if}
