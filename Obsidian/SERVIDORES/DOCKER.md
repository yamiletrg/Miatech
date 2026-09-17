
# DOCKER

## Más usados

> Ver logs en vivo

```bash
docker logs -f <container_name>
```

> Detener contenedor

```bash
docker stop <container_name>
```

> Iniciar contenedor

```bash
docker start <container_name>
```

---

## Contenedores

```bash
docker ps      # activos
docker ps -a   # todos
```

---

## Logs

```bash
docker logs "id_contenedor"      # hasta el momento
docker logs -f "id_contenedor"   # en vivo
```

> [!WARNING]
> Error 404 → revisar Traefik.

---

## Entrar a contenedor

```bash
docker exec -it "id_contenedor" /bin/sh
```

### Ejemplo

```bash
docker exec -it aa8251824e25 /bin/sh

ls
cd logs
ls
cat 20260506.json
```


## Old
docker logs -f <container_name>
docker stop <container_name>
docker start <container_name>




docker ps -> contenedores activos
docker ps -a  -> todos los contenedores : 


docker logs "id_contenedor"      -> log hasta el momento que esta esta configurado:  
docker logs -f "id_contenedor"   ->	en vivo  
	
docker logs 8023cba29376(id contenedor) -> error 404, revisar el traefic  

-- comando contenedor especifico
docker exec -it "id contenedor"

-- comando contenedor especifico (como terminal carpeta especifica)
docker exec -it aa8251824e25 /bin/sh
ls
cd logs
ls
cat 20260506.json

