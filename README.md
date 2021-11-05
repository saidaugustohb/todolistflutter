# todolistflutter


-> sudo docker pull mongo
-> sudo docker pull mongo:4.2.2
-> sudo docker images
-> sudo mkdir -p /mongodata
-> sudo docker run -it -v mongodata:/data/db -p 27017:27017 --name mongodb -d mongo
-> sudo docker exec -it mongodb bash


-> mongo
-> show dbs
-> use todolist
-> db.createCollection('tasks') #Una coleccion hace referencia a una tabla
-> db.tasks
-> db.tasks.insert({ 'name': 'Sacar el perro' })
-> db.tasks.find()
