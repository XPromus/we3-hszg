//https://www.baeldung.com/kotlin/spring-rest-error-handling

#import "../../Template/template.typ": chapter-title-slide, subchapter-title-slide
#import "../../Template/definitions.typ": *

#let customTemplateMessagesTitle = [
  Custom Template Messages
]

#chapter-title-slide(
  section-name: customTemplateMessagesTitle
)

#slide[
  = #customTemplateMessagesTitle
  #set align(horizon + center)
  ```kotlin
  class ErrorMessageModel(
    var status: Int? = null,
    var message: String? = null
  )
  ```
  #set align(left)
  - `status` speichert den HTTP Status Code
  - `message` speichert eine benutzerdefinierte Nachricht, die an das Frontend geschickt wird, wenn ein Error geworfen wird
]

#let exceptionControllerAdviceTitle = [
  Exception Controller Advice
]

#chapter-title-slide(
  section-name: exceptionControllerAdviceTitle
)

#slide[
  = #customTemplateMessagesTitle
  #set align(horizon + center)
  ```kotlin
  @ControllerAdvice
  class ExceptionControllerAdvice {
    fun handleIllegalStateException(
      ex: IllegalStateException
    ): ResponseEntity<ErrorMessageModel> {
      val errorMessage = ErrorMessageModel(
        HttpStatus.NOT_FOUND.value(),
        ex.message
      )
      return ResponseEntity(
        errorMessage,
        HttpStatus.BAD_REQUEST
      )
    }
  }
  ```
]

#slide[
  = #customTemplateMessagesTitle
  #set align(horizon + center)
  ```kotlin
  class ArticleNotFoundException(
    message: String
    ): RuntimeException(message) {

  }
  ```
  #set align(left)
  - Es können eigene Exceptions erstellt werden
  - Diese Exceptions sollten spezifische Szenarien im Backend abdecken
]

#slide[
  = #customTemplateMessagesTitle
  #set align(horizon + center)
  ```kotlin
  fun handleArticleNotFoundException(ex: ArticleNotFoundException): ResponseEntity<ErrorMessageModel> {
    val errorMessage = ErrorMessageModel(
      HttpStatus.NOT_FOUND.value(),
      ex.message
    )
    return ResponseEntity(
      errorMessage, HttpStatus.NOT_FOUND
    )
  }
  ```
]

#let implementingExceptionsTitle = [
  Einbindung
]

#chapter-title-slide(
  section-name: implementingExceptionsTitle
)

#slide[
  = #implementingExceptionsTitle
  #set align(horizon + center)
  ```kotlin
  fun getArticle(id: String): ArticleModel {
    return articles.find { articleModel -> articleModel.id == id } ?: throw ArticleNotFoundException("Article not found")
  }
  ```
]

#slide[
  = #implementingExceptionsTitle
  #set align(horizon + center)
  ```kotlin
  fun createArticle(title: String): ArticleModel {
    val article = (articles.find { articleModel -> articleModel.title == title })
    if (article != null) {
      throw IllegalStateException("Article with the same title already exists")
    }
    return ArticleModel("4", title)
  }
  ```
]

#slide[
  = #implementingExceptionsTitle
  #set align(horizon + center)
  ```kotlin
  fun updateArticle(id: String, title: String): ArticleModel {
    val article = (articles.find { articleModel -> 
      articleModel.id == id 
    } ?: throw ArticleNotFoundException("Article not found"))
    if (title.length > 50) {
      throw IllegalArgumentException("Article title too long")
    }
    article.title = title
    return article
  }
  ```
]

#let responseStatusExceptionTitle = [
  ResponseStatusException Class  
]

#chapter-title-slide(
  section-name: responseStatusExceptionTitle
)

#slide[
  = #responseStatusExceptionTitle
  #set align(horizon + center)
  ```kotlin
  @PutMapping
  fun updateArticle(
    @RequestParam id: String, 
    @RequestParam title: String
  ): ArticleModel {
    try {
      return articleService.updateArticle(id, title)
    } catch (ex: IllegalArgumentException) {
      throw ResponseStatusException(
        HttpStatus.BAD_REQUEST.localizedMessage, ex
      )
    }
  }
  ```
]

#slide[
  = #responseStatusExceptionTitle
  #set align(horizon)
  - Gut um Exceptions dynamisch zu handeln
  - Exceptions können in der Methoden Definition des Controllers verarbeitet werden
  - Es wird kein globaler Controller benötigt
  - Es müssen Orte definiert werden, wo spezifische Exceptions gehandelt werden
]
