<template>
    <form class="form-container">

      <div class="modal-overlay" v-if="showAddUnitModal">
            <div class="modal-content">
                <h3>Adicionar unidade de medida</h3>
                <input type="text" v-model="newUnitName" placeholder="Nome ex: Quilo" maxlength="25"/>
                <input type="text" v-model="newUnitAbbreviation" placeholder="Abreviação ex: KG" maxlength="5"/>
                <button @click="addUnit">Adicionar</button>
                <button @click="showAddUnitModal = false">Cancelar</button>
            </div>
        </div>
        <div class="modal-overlay" v-if="showAddCategoryModal">
            <div class="modal-content">
                <h3>Criar Categoria</h3>
                <input type="text" v-model="newUnitName" placeholder="Nome ex: Praia" maxlength="25"/>
                <button @click="addCategory">Adicionar</button>
                <button @click="showAddCategoryModal = false">Cancelar</button>
            </div>
        </div>

        <div class="item-container">
            <label for="name">Nome do produto:</label>
            <input v-model="name" v-bind:class="{ 'is-invalid': errors.name }" type="text" id="name"> 
            <span v-if="errors.name" class="error">{{ errors.name[0] }}</span>
        </div>
        <div class="item-container">
            <label for="image">imagem:</label> 
            <input placeholder="Link da imagem" v-model="image" v-bind:class="{ 'is-invalid': errors.image }" type="text" id="image"> 
            <span v-if="errors.image" class="error">{{ errors.image[0] }}</span>
        </div>
        <div class="item-container category-container">

            <label for="category">Categoria:</label>
            <select v-model="category" v-bind:class="{ 'is-invalid': errors.category }" type="text" id="category">
            <option v-for="category in categories" :key="category.id" :value="category">{{category.name}}</option>
            </select>
            <button @click.prevent="showAddCategoryModal = true">Criar</button>
            <span v-if="errors.category" class="error">{{ errors.category[0] }}</span>
        </div>
        <div class="item-container unit-container">

          <label for="unit">Unidade:</label> 
      <select v-model="selectedUnit" v-bind:class="{ 'is-invalid': errors.unit }" id="unit">
        <option v-for="unit in units" :key="unit.id" :value="unit">{{unit.abbreviation}}</option>
      </select>
      <button @click.prevent="showAddUnitModal = true">Criar</button>
      <span v-if="errors.unit" class="error">{{ errors.unit[0] }}</span>
        </div>
        <div class="item-container">

            <label for="description">Descrição:</label> 
            <textarea class="descriptionbox" v-model="description" v-bind:class="{ 'is-invalid': errors.description }" type="text" id="description" maxlength="1000"
            ></textarea> 
            <span v-if="errors.description" class="error">{{ errors.description[0] }}</span>
        </div>
        <div class="item-container">

            <label for="price">Preço:</label> 
            <input v-model="price" v-bind:class="{ 'is-invalid': errors.price }" type="number" id="price" min="0"> 
            <span v-if="errors.price" class="error">{{ errors.price[0] }}</span>
        </div>
        <div class="item-container">

            <label for="featured">Em destaque</label> 
            <input v-model="featured" v-bind:class="{ 'is-invalid': errors.featured }" type="checkbox" class ="featured"
                id="featured"> 
            <span v-if="errors.featured" class="error">{{ errors.featured[0] }}</span>
        </div>
        <div class="item-container">

            <label for="stocked">Em estoque</label> 
            <input v-model="stocked" v-bind:class="{ 'is-invalid': errors.stocked }" type="number" min="0"
                id="stocked" class="stocked"> 
            <span v-if="errors.stocked" class="error">{{ errors.stocked[0] }}</span>
        </div>
        <div class="button-container">
            <button @click.prevent="saveProduct">Salvar</button>
            <button @click.prevent="cancel">Cancelar</button>
        </div>

    </form>


        
</template>


<style scoped>  

.featured {
    width: 1.5em;
    height: 1.5em;
    border: 1px solid #182d4d;
    border-radius: 5px;
    box-sizing: border-box;
    padding: 0.5em;
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    color: #182d4d;
    background-color: #ffffff;
}

.category-container button {
    width: 6em;
    height: 2em;
    border: 1px solid #182d4d;
    border-radius: 5px;
    box-sizing: border-box;
    padding: 0.5em;
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    color: #182d4d;
    background-color: #ffffff;
}
.unit-container button {
    width: 6em;
    height: 2em;
    border: 1px solid #182d4d;
    border-radius: 5px;
    box-sizing: border-box;
    padding: 0.5em;
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    color: #182d4d;
    background-color: #ffffff;
}

select {
    width: 100%;
    height: 2em;
    border: 1px solid #182d4d;
    border-radius: 5px;
    box-sizing: border-box;
    padding: 0.5em;
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    color: #182d4d;
}

.descriptionbox {
    width: 100%;
    height: 5em;
    border-radius: 5px;
    box-sizing: border-box;
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    color: #182d4d;
    text-align: left;
    padding: 0.5em;
    border: 1px solid #182d4d;
    white-space: pre-wrap;
    resize: none;
}
label {
    font-family: 'Roboto', sans-serif;
    font-size: 1.2em;
    color: #182d4d;
}

.modal-overlay {
    position: absolute;
    z-index: 1;
    top: 25%;
    left: 50%;
}

.modal-content {
    position: absolute;
    background-color: #ffffff;
    padding: 4em;
    border-radius: 10px;
    box-sizing: border-box;
    border: 2px solid #182d4d;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
}

.form-container {
    font-family: 'Roboto', sans-serif;
    display: grid;
    grid-template-columns: 0fr 1fr;
    justify-content: center;
    align-items: center;
    width: 50em;
    height: 36em;
    padding: 1em;
    padding-bottom: 10em;
    margin-top: 5em;
    padding-left: 2em;
    margin-left: 30em;
    color: #182d4d;
    background-color: #ffffff;
    border: 2px solid #182d4d;
    border-radius: 10px;
    box-sizing: border-box;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
    gap: 1.5em;
}

.button-container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    gap: 6em;
    position: relative;
    bottom: 1em;
    left: 8rem;
    align-items: center;
}

.item-container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    width: 50%;
}

.img-container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}


.imglink {
    display: flex;
    flex-direction: column;
    gap: 0em;
    width: 50%;
    padding-left: 3em;
}

.imgcheck {
    display: flex;
    flex-direction: column;
    gap: 0em;
    padding-right: 4em;
}


input {
    align-self: center;
    width: 100%;
    height: 1em;
    padding: 1.5em;
    margin-bottom: 0.5em;
    border: 2px solid #182d4d;
    border-radius: 4px;
    box-sizing: border-box;
}


.button-container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    gap: 6em;
    align-items: center;
}


button {
    background-color: #182d4d;
    border: 2px solid #ffffff;
    color: white;
    justify-content: center;
    padding: 1.5em 6em;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 0.8em;
    cursor: pointer;
    border-radius: 4px;
    transition: 0.5s ease-in-out;
}

button:hover {
    background-color: #ffffff;
    color: #182d4d;
    border: 2px solid #182d4d;
    transition: 0.5s ease-in-out;
    transform: scale(1.1);
}

button:nth-child(2) {
    background-color: #ffffff;
    color: #182d4d;
    border: 2px solid #182d4d;
}

button:nth-child(2):hover {
    background-color: #182d4d;
    color: #ffffff;
    border: 2px solid #ffffff;
    transition: 0.5s ease-in-out;
    transform: scale(1.15);
}

@media screen and (max-width: 800px) {
    .form-container {
        width: 100%;
        height: 100%;
        margin-left: 0%;
    }
}
</style>

<script>

import axios from 'axios'

export default {
  data() {
    return {
      selectedUnit: null,
      units: [],
      categories: [],
      showAddUnitModal: false,
      showAddCategoryModal: false,
      newUnitAbbreviation: '',
      name: '',
      image: '',
      description: '',
      category: '',
      unit: '',
      stocked: 0,
      price: 0,
      featured: false,
      errors: {},
      loading: false,
      products: []
    }
  },
  mounted() {
    this.fetchUnits();
    this.fetchCategories();
  },
  methods: {
    fetchUnits() {
      axios
        .get('http://localhost:3000/api/v1/measurement_units')
        .then(response => {
          this.units = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    fetchCategories() {
      axios
        .get('http://localhost:3000/api/v1/categories')
        .then(response => {
          this.categories = response.data;
        })
        .catch(error => {
          console.error(error);
        });
    },
    addCategory() {
      axios
        .post('http://localhost:3000/api/v1/categories', {
          name: this.newCategoryName
        })
        .then(response => {
          this.categories.push(response.data);
          this.selectedCategory = response.data;
          this.showAddCategoryModal = false;
        })
        .catch(error => {
          console.error(error);
        });
    },
    addUnit() {
      axios
        .post('http://localhost:3000/api/v1/measurement_units', {
          abbreviation: this.newUnitAbbreviation,
          name: this.newUnitName
        })
        .then(response => {
          this.units.push(response.data);
          this.selectedUnit = response.data;
          this.showAddUnitModal = false;
        })
        .catch(error => {
          console.error(error);
        });
    },
    saveProduct() {
      this.loading = true;
      this.errors = {}
      // Validate input fields
      if (!this.name) {
        this.errors.name = ['Nome do produto não pode ficar em branco']
      }
      if (this.name.length > 25 || this.name.length < 3) {
        this.errors.name = ['Nome do produto deve ter entre 3 e 25 caracteres']
      }
      if (!this.image) {
        this.errors.image = ['imagem do produto não pode ficar em branco']
      }
      if (!this.description) {
        this.errors.description = ['Descrição do produto não pode ficar em branco']
      }
      if (!this.category) {
        this.errors.category = ['Categoria do produto não pode ficar em branco']
      }
      if (this.category.length > 25 || this.category.length < 3) {
        this.errors.category = ['Categoria do produto deve ter entre 3 e 25 caracteres']
      }
      if (!this.selectedUnit) {
        this.errors.unit = ['Unidade de medida não pode ficar em branco']
      }
      if (this.stocked < 0) {
        this.errors.stocked = ['Quantidade em estoque não pode ser negativa']
      }
      if (this.price < 0) {
        this.errors.price = ['Preço não pode ser negativo']
      }
      // Save product if input is valid
      if (Object.keys(this.errors).length === 0) {
        // Send request to save product
        axios.post('http://localhost:3000//api/v1/products', {
          name: this.name,
          image: this.image,
          description: this.description,
          category_id: this.category.id,
          unit: this.selectedUnit.abbreviation,
          measurement_unit_id: this.selectedUnit.id,
          stocked: this.stocked,
          price: this.price,
          featured: this.featured
        })
          .then(response => {
            this.loading = false
            this.$router.push({ name: 'Products' })
          })
          .catch(error => {
            this.loading = false
            if (error.response.status === 422) {
              this.errors = error.response.data.errors
            }
          })
      }
    },
    cancel() {
      this.$router.push({ name: 'Products' })
    }
  }
}
</script>
