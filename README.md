# tasks_planner
Descriptif et Fonctionnalités :
	L’application est un gestionnaire de planning. Elle permet à l’utilisateur d’insérer des tâches à faire. Il fournit le nom de la tâche, sa date butoir (avec l’heure et la minute) ainsi que le degré d’importance (low, medium et high)
	L’utilisateur peut ajouter les tâches et les supprimer. 
	On ne quitte pas la view où on ajoute les tâches même si une tâche est insérée afin de permettre d’en ajouter rapidement. 
	Pour supprimer une tâche, il suffit de faire un swip vers la gauche. 
	L’application implémente CoreData pour stocker les données (les supprimer aussi). Ainsi, les tâches sont enregistrées même en quittant l’application.

Petites fonctionnalités implémentées :
-	 La couleur de chaque « cell » du TableView dépend du degré d’importance de la tâche (vert : low, medium : jaune, high : rouge).
-	Lorsque l’utilisateur saisit le nom d’une tâche, il peut appuyer sur « terminé » pour réduire le clavier.
