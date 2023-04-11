<script lang="ts">
  import Table from '../../components/Table.svelte';
  import type ObjArr from '../../types/ObjArr';
  let id: number;
  let data: ObjArr = [];
  let dispTable = false;

  async function handleSubmit() {
    const res = await fetch('/vol/submit', {
      method: 'POST',
      body: JSON.stringify({ id }),
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
  <label for="id1">Investment ID</label>
  <input type="text" name="id1" placeholder="Investment ID" required bind:value={id} />
  <button class="contrast" type="submit">Get Volatility</button>
</form>
{#if dispTable}
  <Table {data} />
{/if}
