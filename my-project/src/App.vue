<template>
  <div id="app">
      <div class="list-container" :key="List.id">
        <List
          v-for="list in lists"
          :key="list.id"
          class="list"
          :list="list"
          :listName.sync="list.name"
          @add-card="addCard"
        />
      </div>
    <input type="text" class="list-input" @change="addList" />
  </div>
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import List from "@/components/List.vue";
import { IList } from "@/types";
import { createInitialLists } from "@/initialData.ts";
import { IAddCardEvent } from "@/components/List.vue";

@Component({
  components: {
    List
  }
})
export default class App extends Vue {
  lists: IList[] = createInitialLists();
  listCreatedCount = 2;
  cardCreatedCount = 4;

  addList(event: Event & { currentTarget: HTMLInputElement }): void {
    const newList = {
      id: this.listCreatedCount + 1,
      name: event.currentTarget.value,
      cards: []
    };
    this.lists.push(newList);
    this.listCreatedCount;
    event.currentTarget.value = "";
  }

  addCard({ listId, text }: IAddCardEvent): void {
    const list = this.lists.find(list => list.id === listId);
    if (list == undefined) return;
    const newCard = {
      id: this.cardCreatedCount + 1,
      text
    };
    list.cards.push(newCard);
    this.cardCreatedCount;
  }
  addCard(): void {}
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
