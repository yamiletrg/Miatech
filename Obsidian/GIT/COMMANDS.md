

```
git stash       ->  guardar cambios
git stash pop   ->  recuperar cambios


```


## stash

### Guardar los cambios en el stash

```
git stash push -m "SQP01061 - cambios procedimiento"
```

Si también tienes archivos **nuevos** (untracked) que quieres guardar, usa:

```
git stash push -u -m "SQP01061 - cambios procedimiento"
```

La opción `-u` incluye los archivos nuevos.

---

### Ver los stashes guardados

```
git stash list
```

Ejemplo:

```
stash@{0}: On develop: SQP01061 - cambios procedimientostash@{1}: On develop: Corrección reporte impuestos
```

---

### Recuperarlo más adelante

Si quieres aplicarlo **sin eliminarlo del stash** (para conservar una copia):

```
git stash apply stash@{0}
```

Si quieres aplicarlo **y eliminarlo del stash**:

```
git stash pop stash@{0}
```

---

### Ver el contenido de un stash antes de aplicarlo

```
git stash show -p stash@{0}
```

---

### Si vas a seguir haciendo otros cambios

Puedes crear varios stashes con diferentes nombres:

```
git stash push -u -m "SQP01061"git stash push -u -m "Validación impuestos"git stash push -u -m "Refactor módulo ventas"
```

Luego eliges cuál recuperar con `apply` o `pop`.