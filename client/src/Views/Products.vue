<template>
    <div class="container">
      <input
        class="searchbox"
        type="text"
        v-model="searchTerm"
        placeholder="Pesquisar Produto"
        @input="searchproducts"
      />
        <router-link to="/productRegistration" class="addBtn">Adicionar Produto</router-link>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th class="text-left">Foto</th>
              <th class="text-left">Nome</th>
              <th class="text-left">Descrição</th>
              <th class="text-left">Categoria</th>
              <th class="text-left">Unidade</th>
              <th class="text-left">Em estoque</th>
               <th class="text-left">Preço</th>
              <th class="text-left">Ação</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="product in filteredproducts" :key="product.id">
              <td>
                <img :src="product.image" alt="Foto" width="50" />
              </td>
              <td>{{ product.name }}</td>
              <td>{{ product.description }}</td>
              <td>{{ product.category.name }}</td>
              <td>{{ product.unit}}</td>
              <td>{{ product.stocked }}</td>
                <td>{{ product.price }}</td>
              <td>
                <button @click="deleteproduct(product.id)">Delete</button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </template>
  
  <style scoped>
  
  .container {
    position: relative;
    border-radius: 20px;
    width: 60em;
    height: 30em;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
    display: flex;
    flex-direction: column;
    background-color: rgb(255, 255, 255);
    border: 2px solid #182d4d;
    text-align: center;
    justify-content: center;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    padding-top: 13%;
    margin-left: 23%;
    overflow-y: auto
  }
  .addBtn {
    position: absolute;
    top: 0;
    left: 0;
    width: 9em;
    height: 1.5em;
    padding: 0.6em;
    color: #000;
    z-index: 10;
    padding-left: 1em;
    background-color: #fff;
    border: 1px solid #929292;
    border-radius: 10px;
    text-decoration: none;
    text-align: center;
    font-size: 1em;
    transition: all 0.2s ease-in-out;
    margin-left: 1em;
    margin-top: 0.5em;
  }
  
  .addBtn:hover {
    background-color: #182d4d;
    color: #fff;
    transition: all 0.2s ease-in-out;
    transform: scale(1.1);
  }
  
  .searchbox {
    position: absolute;
    top: 0;
    right: 0;
    width: 20em;
    height: 2em;
    border: 1px solid #ccc;
    border-radius: 4px;
    background-color: #fff;
    padding: 0.6em;
    color: #000;
    z-index: 10;
    padding-left: 1em;
  }
  
  
  .box h1{
    font-size: 1.5em;
    color: #000;
    margin-top: 20px;
  }
  
  .box img {
    width: 15vh;
    height: 10vh;
  }
  
  
  .table-wrapper {
    position: relative;
    height: 55em;
    margin-top: -4em;
    overflow-y: auto;
  }
  
  table {
    width: 100%;
    border-collapse: collapse;
    position: sticky;
    top: 0;
  }
  
  table img {
    width: 5rem;
    height: 3rem;
    transition: all 0.2s ease-in-out;
  }
  table img:hover {
    transform: scale(1.5);
    transition: all 0.2s ease-in-out;
    width: 10rem;
    height: 6rem;
  }
  
  td,
  th {
    border: 1px solid #ddd;
    padding: 0.4em;
    justify-content: center;
    align-items: center;
  }
  
  tr:nth-child(even) {
    background-color: #f2f2f2;
  }
  
  tr:hover {
    background-color: #ddd;
  }
  
  th {
    text-align: left;
    background-color: #182d4d;
    position: sticky; /* add this style */
    top: 0; /* add this style */
    color: rgb(255, 255, 255);
  }
  td {
    text-align: left;
    background-color: #fff;
    color: rgb(0, 0, 0);
  }
  
  </style>
  <script>
  import axios from 'axios';
  
  export default {
    data() {
      return {
        products: [],
        searchTerm: ''
      };
    },
    mounted() {
      this.getProducts();
    },
    computed: {
filteredproducts() {
if (this.searchTerm) {
return this.products.filter(product => {
return product.name
.toLowerCase()
.includes(this.searchTerm.toLowerCase());
});
} else {
return this.products;
}
}
},
    methods: {
      async getProducts() {
        try {
          const response = await axios.get('http://[::1]:3000/api/v1/products');
          this.products = response.data;
        } catch (error) {
          console.error(error);
        }
      },
      async deleteproduct(id) {
        try {
          await axios.delete(`http://[::1]:3000/api/v1/products/${id}`);
          this.getProducts();
        } catch (error) {
          console.error(error);
        }
      },
      searchproducts() {
        this.filteredproducts;
      }
    }
  };
  </script>