
class Materia{
	var estudiantesInscriptos = []
	var property creditoDeMateria 
	var property anioAQueCorresponde
	
	method estaInscripto(estudiante){
	estudiantesInscriptos.contains(estudiante)
	}

}

// TODO Nombre poco descriptivo
class Prerrequisito1 inherits Materia{
	
	var property materiaEsCorrelativaDe = #{} 	

	method prerrequisitos(estudiante){
		return	materiaEsCorrelativaDe.all{materia => estudiante.aproboMateria(materia)}
		
	}		
}

// TODO Nombre poco descriptivo
class Prerrequisito2 inherits Prerrequisito1{
	var property creditosNecesarios
	override method prerrequisitos(estudiante){
		return estudiante.cantidadTotalDeCreditos() >= creditosNecesarios	
	}
}




class Estudiante{
	var property materiasAprobadas // es una lista de objetos "materiaAprobada" 
	method puedeCursarMateria(materia){
		return !materia.estaInscripto(self) 
		// TODO Arriba dice que es una lista de materias aprobadas, pero esto parece indicar que es una lista de materias. 
		and !materiasAprobadas.contains(materia) 
		and materia.prerrequisito(self) 	
	}
	
	
	method aproboMateria(materia){
		return materiasAprobadas.any{materiaAprobada => materiaAprobada.materia() == materia}
	}
	
	method cantidadTotalDeCreditos() {
		var totalDeCreditos
		materiasAprobadas.forEach{materiaAprobada => totalDeCreditos + materiaAprobada.materia().creditoDeMateria()}
	}
	
}



class MateriaAprobada{
	var	property materia
	var property nota
}
