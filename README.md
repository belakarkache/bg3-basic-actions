# Basic Actions

*[English](#english) · [Português](#português)*

Use any party member's potions and scrolls straight from your Action Bar — no
more passing items around mid-fight.

![Version](https://img.shields.io/badge/version-1.0.0-blue) ![BG3](https://img.shields.io/badge/BG3-Patch%208-green)

---

## English

### What it does

Adds two buttons to the Action Bar:

- **Take Potion** — every potion carried by anyone in the party
- **Use Scroll** — every scroll carried by anyone in the party

Click one and the item is used from the bag of whoever is actually carrying it.
The list only ever shows what the party really has, and the quantity appears in
the tooltip.

It uses the game's own rules: the Bonus Action (or Action) is charged by the
engine, and buttons grey out when you can't afford them. Scrolls keep their
native targeting, animation and effect.

### Requirements

- Baldur's Gate 3, Patch 8
- [BG3 Script Extender](https://github.com/Norbyte/bg3se) — **required**

### Installing

1. **Back up your save first.** This mod grants spells that are written into
   your save file.
2. Download `BasicActions.pak` from the [Releases](../../releases) page.
3. Put it in your Mods folder:
   `%LOCALAPPDATA%\Larian Studios\Baldur's Gate 3\Mods`
   (paste that into the Windows Explorer address bar) or install using the BG3 Mod Manager
4. Open **BG3 Mod Manager**, enable **Basic Actions**, and click
   *Export Load Order to Game*.
5. Launch the game. The two buttons appear on the Action Bar.

### Good to know

- A few scrolls that open their own sub-menu (Chromatic Orb, Enlarge/Reduce,
  Disguise Self…) don't appear in the list. Use them from the inventory.
- Items added by other mods won't show up unless the mod is rebuilt to include
  them.
- Works alongside BetterHotbar, ImpUI, MCM and 5eSpells — it doesn't overwrite
  any Larian file.
- Not tested in co-op.

### Repository contents

This repository holds the mod's source files — the Lua scripts, the spell stats,
the localization and the icons — exactly as they are packed into the `.pak`.
The build tooling that generates them is not published.

To repack it yourself you need LSLib/Divine. The `icon/` tree merges into the
mod tree, and the UI resource list has to be converted to `.lsf` first:

```
mkdir -p build
cp -r mod/BasicActions/. build/
cp -r icon/. build/
divine -g bg3 -a convert-resource -o lsf \
  -s "build/Public/BasicActions/Content/UI/[PAK]_UI/_merged.lsx" \
  -d "build/Public/BasicActions/Content/UI/[PAK]_UI/_merged.lsf"
rm "build/Public/BasicActions/Content/UI/[PAK]_UI/_merged.lsx"
divine -g bg3 -a create-package -s build -d BasicActions.pak
```

---

## Português

### O que faz

Adiciona dois botões à Action Bar:

- **Tomar Poção** — todas as poções carregadas por qualquer membro do grupo
- **Usar Pergaminho** — todos os pergaminhos carregados por qualquer membro

Clicou, o item é usado da mochila de quem realmente o carrega. A lista mostra só
o que o grupo tem de verdade, e a quantidade aparece no tooltip.

O mod usa as regras do próprio jogo: quem cobra a Ação Bônus (ou a Ação) é a
engine, e o botão fica acinzentado quando você não tem o recurso. Pergaminhos
mantêm mira, animação e efeito nativos.

### Requisitos

- Baldur's Gate 3, Patch 8
- [BG3 Script Extender](https://github.com/Norbyte/bg3se) — **obrigatório**

### Instalação

1. **Faça backup do seu save.** O mod concede magias que ficam gravadas no save.
2. Baixe o `BasicActions.pak` na página de [Releases](../../releases).
3. Coloque o arquivo na sua pasta de Mods:
   `%LOCALAPPDATA%\Larian Studios\Baldur's Gate 3\Mods`
   (cole isso na barra de endereço do Explorador de Arquivos) ou instale normalmente pelo BG3 Mod Manager
4. Abra o **BG3 Mod Manager**, ative o **Basic Actions** e clique em
   *Export Load Order to Game*.
5. Inicie o jogo. Os dois botões aparecem na Action Bar.

### Bom saber

- Alguns pergaminhos que abrem submenu próprio (Orbe Cromático, Ampliar/Reduzir,
  Disfarçar-se…) não aparecem na lista. Use pelo inventário.
- Itens de outros mods não aparecem, a menos que o mod seja regerado incluindo
  eles.
- Convive com BetterHotbar, ImpUI, MCM e 5eSpells — não sobrescreve nenhum
  arquivo da Larian.
- Não testado em co-op.

### Conteúdo do repositório

Este repositório guarda os arquivos-fonte do mod — os scripts Lua, os stats das
magias, a localização e os ícones — exatamente como vão dentro do `.pak`. As
ferramentas de build que geram esses arquivos não são publicadas.

Para reempacotar por conta própria você precisa do LSLib/Divine. A árvore
`icon/` se funde à do mod, e a lista de recursos da UI precisa ser convertida
para `.lsf` antes:

```
mkdir -p build
cp -r mod/BasicActions/. build/
cp -r icon/. build/
divine -g bg3 -a convert-resource -o lsf \
  -s "build/Public/BasicActions/Content/UI/[PAK]_UI/_merged.lsx" \
  -d "build/Public/BasicActions/Content/UI/[PAK]_UI/_merged.lsf"
rm "build/Public/BasicActions/Content/UI/[PAK]_UI/_merged.lsx"
divine -g bg3 -a create-package -s build -d BasicActions.pak
```

---

Autora: **icka.dev**
