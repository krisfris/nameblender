<script setup>
import { ref } from "vue";

import Textarea from "./Textarea.vue";
import Button from "./Button.vue";

const end_tag = "<end>";

let names_str = ref("");
let output = ref("");

class DefaultDict {
  constructor(defaultInit) {
    return new Proxy(
      {},
      {
        get: (target, name) =>
          name in target
            ? target[name]
            : (target[name] =
                typeof defaultInit === "function"
                  ? new defaultInit().valueOf()
                  : defaultInit),
      }
    );
  }
}

const buildModel = (words) => {
  const model = new DefaultDict(Array);

  const add_token = (token, target) => {
    model[token].push(target);
  };

  words.forEach((word) => {
    add_token("", word.slice(0, 2));
    for (let i = 0; i < word.length - 2; i++) {
      add_token(word.slice(i, i + 2), word[i + 2]);
    }
    add_token(word.slice(-2), end_tag);
  });

  return model;
};

const randomChoice = (array) => {
  return array[Math.floor(Math.random() * array.length)];
};

const generateWord = (model) => {
  let result = "";
  while (true) {
    let options = model[result.slice(-2)];
    let chosen = randomChoice(options);
    if (chosen === end_tag) break;
    result = result.concat(chosen);
  }
  return result;
};

const generate_clicked = () => {
  names_str.value = names_str.value.trim();
  const names = names_str.value.split("\n");

  const model = buildModel(names);

  let result = [];

  for (let i = 0; i < 100; i++) {
    result.push(generateWord(model));
  }

  // remove dups
  result = [...new Set(result)];

  // remove original names
  let original = new Set(names);
  result = result.filter((x) => !original.has(x));

  output.value = result.join("\n");
};
</script>

<template>
  <h3 class="bold my-2">Enter list of names:</h3>
  <Textarea class="mb-2" v-model="names_str" />
  <Button @click="generate_clicked" class="mb-2">Generate</Button>
  <h3 class="bold my-2">Output:</h3>
  <Textarea class="mb-2" v-model="output" />
</template>
