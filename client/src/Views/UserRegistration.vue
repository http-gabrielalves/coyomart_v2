<template>
  <form class="form-container">

    <label for="name">Nome:</label><br>
    <input v-model="name" v-bind:class="{ 'is-invalid': errors.name }" type="text" id="name"><br>
    <span v-if="errors.name" class="error">{{ errors.name[0] }}</span>

    <label for="address">Endereço:</label><br>
    <input v-model="address" v-bind:class="{ 'is-invalid': errors.address }" type="text" id="address"><br>
    <span v-if="errors.address" class="error">{{ errors.address[0] }}</span>

    <div class="img-container">
      <div class="imglink">
        <label for="picture">Link da imagem:</label><br>
        <input v-model="picture" v-bind:class="{ 'is-invalid': errors.picture }" type="text" id="picture"><br>
        <span v-if="errors.picture" class="error">{{ errors.picture[0] }}</span>
      </div>
      <div class="imgcheck">
        <input v-model="includePicture" type="checkbox" id="include-picture">
        <label for="include-picture">Incluir imagem</label>
      </div>
    </div>

    <label for="email">Email:</label><br>
    <input v-model="email" v-bind:class="{ 'is-invalid': errors.email }" type="text" id="email"><br>
    <span v-if="errors.email" class="error">{{ errors.email[0] }}</span>

    <div class="button-container">
      <button v-on:click.prevent="saveUser">Salvar</button>
      <button v-on:click.prevent="cancel">Cancelar</button>
    </div>
  </form>

</template>

<style scoped>
.form-container {
  border: 2px solid #182d4d;
  font-size: 1.7em;
  position: relative;
  border-radius: 20px;
  width: 30em;
  height: auto;
  overflow: auto;
  color: #000;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
  display: flex;
  flex-direction: column;
  background-color:#fafafa;
  text-align: center;
  justify-content: center;
  font-family: 'Roboto', sans-serif;
  margin-left: 30%;
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
  width: 50%;
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
  padding: 0.6em 2em;
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
      name: '',
      address: '',
      picture: '',
      email: '',
      includePicture: false,
      errors: {},
      loading: false,
      usersRegistred: []
    }
  },
  methods: {
    saveUser() {
      this.loading = true;
      this.errors = {}
      axios.post('http://localhost:3000//api/v1/check_email', {
        email: this.email
      })
        .then(response => {
          if (response.data.exists === true) {
            this.errors.email = ['E-mail já cadastrado']
          } else {
            if (!this.name) {
              this.errors.name = ['Nome não preenchido']
            } else if (/\d/.test(this.name)) {
              this.errors.name = ['Nome não pode conter números']
            }
            if (!this.address) {
              this.errors.address = ['Endereço não preenchido']
            }
            if (this.includePicture && !this.picture) {
              this.errors.picture = ['Link da imagem não preenchido']
            }
            if (!this.email) {
              this.errors.email = ['E-mail não preenchido']
            } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(this.email)) {
              this.errors.email = ['E-mail inválido']
            }
          }
          if (Object.keys(this.errors).length === 0) {
            axios.post('http://localhost:3000//api/v1/users', {
              name: this.name,
              address: this.address,
              picture: this.picture,
              email: this.email
            })
              .then(response => {
                if (response.status === 201) {
                  this.name = '';
                  this.address = '';
                  this.picture = '';
                  this.email = '';
                  this.loading = false;
                }
              })
              .catch(error => {
                // handle error
                console.log(error)
              })
          }
        })
    },
    cancel() {
      this.$router.push({ name: 'Users' })
    }
  }
}
</script>
