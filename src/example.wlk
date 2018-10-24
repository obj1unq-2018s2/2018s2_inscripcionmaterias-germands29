
class Materia{
	var estudiantesInscriptos = []
	var property creditoDeMateria 
	var property anioAQueCorresponde
	
	method estaInscripto(estudiante){
	estudiantesInscriptos.contains(estudiante)
	}

}


class Prerrequisito1 inherits Materia{
	
	var property materiaEsCorrelativaDe = #{} 	

	method prerrequisitos(estudiante){
		return	materiaEsCorrelativaDe.all{materia => estudiante.aproboMateria(materia)}
		
	}		
}

class Prerrequisito2 inherits Prerrequisito1{
	var property creditosNecesarios
	override method prerrequisitos(estudiante){
		return estudiante.cantidadTotalDeCreditos() >= creditosNecesarios	
	}
}




class Estudiante{
	var property materiasAprobadas // es una lista de objetos "materiaAprobada" 
	method puedeCursarMateria(materia){
		return !materia.estaInscripto(self) and !materiasAprobadas.contains(materia) and materia.prerrequisito(self) 	
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
