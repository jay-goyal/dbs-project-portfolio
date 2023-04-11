<script lang="ts">
  import type ObjArr from '../types/ObjArr';
  export let data: ObjArr;

  let arr = data !== undefined || data.length > 0 ? Object.keys(data[0]) : [];
</script>

<figure>
  <table>
    <thead>
      <tr>
        <th scope="col">S. No.</th>
        {#each arr as key, i (i)}
          <th scope="col">{key}</th>
        {/each}
      </tr>
    </thead>
    <tbody>
      {#each data as obj, i (i)}
        <tr>
          <td>{i + 1}</td>
          {#each arr as key, j (j)}
            <td>{obj[key]}</td>
          {/each}
        </tr>
      {/each}
    </tbody>
  </table>
</figure>
