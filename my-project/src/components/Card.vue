<template>
    {{ card.text }}
</template>

<script lang="ts">
import { Component, Vue } from "vue-property-decorator";
import { ICard } from "@/types"

@Component
export default class Card extends Vue {
    @Prop({ type: Object, required: ture })
    card! ICard;
}
</script>