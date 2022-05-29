---
date: 2022-05-29
title: 'Quarkus and Kotlin'
hero: 'hero-image.png'
metaDescription: 'I have been using Quarkus for the last week, what did I learn?'
---

Before I start with my Quarkus experience, I need to talk about my experience with frameworks and containers. As some of
you know, I've been a PHP developer for most of my career, but switched to be a Kotlin developer around february 2022.
In the first ~5 years of working professionally I worked with multiple frameworks, even some self-written from employees
at that specific company. Let's start with all of these first.

## PHP frameworks

I started learning PHP in a non-framework way. Writing a router with .htaccess files, that lead to static files or the 
index.php, wasn't something that made me have a lot of headaches. I implemented it using some super globals, like `$_GET`
or `$_SERVER`, which is, as far as I know, the same every framework does, even though most of these frameworks are having
much better mechanisms to do these. But my first job had all these mechanisms implemented, without uses of frameworks.
The most modern technics my first employee had, were libraries like [Smarty3](https://www.smarty.net/v3_overview) and 
[ADOdb](https://adodb.org/dokuwiki/doku.php). Around that time I first looked into frameworks, such as Laravel or Symfony.

While Symfony has a lot of possibilities to modify the framework and their components, Laravel is a bit different. Symfony
had built most of its components by itself, Laravel left the basic work to different libraries. This isn't a real benefit
for each side, but ain't a disadvantage as well... but Symfony just seemed to be more _my way_ of doing things, so I stayed
with this. 

With Symfony I started learning about Shopware, was invited to the Symfony Live Berlin 2018 (since I visited the user group
of sensioLabs, the company behind Symfony, in Cologne the HR people somewhat knew me) and later got to the shopware AG,
simply because I visited this conference, and they contacted a lot of people in search for new employees.

At shopware I was part of the development of Shopware6, which, what a surprise, was using Symfony as a base framework.
Even though I wasn't by far the developer, I would have wanted to be, I got to know a lot of cool people and had lots of
fun working on Shopware, both 5 and 6.

After that I mainly did Symfony and Shopware, till I decided to not use any more PHP for my professional life.

## What is so different, except the language?

Of course the most different thing in using Quarkus is the language, but there are some more things that are different,
even from using Spring Boot, which my current employee uses for most of its services in production.

Quarkus does things different from PHP or Spring Boot. It is not just compiling code, but also solving dependencies and 
configuration on build time. If I decide to inject a service into my current class, PHP and spring need to build the 
dependency tree on build time, which is a lot of overhead, you do not need in a compiled language (which PHP just isn't),
but Spring broadly uses. All in all this causes smaller memory usage for Quarkus, because it does not need a lot to do 
on runtime, which saves code, but also a lot better startup times for Quarkus. I'll append an image from the Quarkus 
Page, which tries to make this more clear.

{% image './metrics.png', 'Metrics for startup time and memory size' %}

The 'Traditional Cloud Native Stack' means usage of frameworks such as Spring, Micronaut or similar stacks.

What I haven't talked about yet is the simplicity of Quarkus to generate Native images. Native probably is a bit of a high
stake, since these files use the GraalVM, but it is as close to being native, as it can. 

## Let's take a look at some code

An entry point for spring looks something like this:

```kotlin
package dev.beisenherz.example

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication // Annotation to mark the class with Configuration and Dependency Injection loading
class ExampleApplication

fun main(args: Array<String>) { // Java Entrypoint
    runApplication<ExampleApplication>(*args)
}
```

This gets setup by the Spring Initializer, but is the start point for every application which uses Spring. But how does 
it look when using Quarkus?

```kotlin

```

For the people, that do not understand: There is no real entrypoint. All the code in Quarkus is YOUR code. But let's 
continue by looking for HTTP endpoints. Let's start with Spring Boot again.

```kotlin
package dev.beisenherz.example

import org.springframework.http.ResponseEntity
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
@RequestMapping("/testing")
class TestingController(
    private val someService: SomeServiceImpl
) {
    @GetMapping
    fun someEndpoint(): ResponseEntity<String> {
        return ResponseEntity.ok("test")
    }
}
```

The @Controller Annotation is usable, yet it's more standard to use the `org.springframework.web.bind.annotation.RestController`
as annotation. Also, the generic type of the ResponseEntity is usable for anything. You can return anything.
RequestMapping is not required, since you are able to set the endpoint with `@GetMapping` but this is the most common 
way, as far as I can see.

What does an endpoint in Quarkus look like?

```kotlin
package dev.beisenherz.example

import javax.ws.rs.Consumes
import javax.ws.rs.GET
import javax.ws.rs.Path
import javax.ws.rs.PathParam
import javax.ws.rs.core.MediaType
import javax.ws.rs.core.Response

@Path("/testing")
class TestingResource(
    val example: ExampleService,
) {

    @GET
    @Consumes(MediaType.APPLICATION_JSON)
    suspend fun process(
        @PathParam type: String
    ): Response {
        return Response.ok("test")
    }
}
```

This is about the same amount of annotations. But instead of using proprietary annotations it uses annotations which are 
used from JavaEE, the former version of Jakarta. This makes the use of Quarkus easier for people coming from the Enterprise 
world.

## One week of quarkus

I have used Quarkus the last week. It was a lot of fun to learn a whole new framework and digging into the documentation
for topics that seemed easy in Spring, but weren't directly available for quarkus. Next week I'll probably need to move 
the new quarkus server into the Preprod environment, and I'm really looking forward to the hosting difficulties with quarkus.
Maybe I'll do another write-up of projects, I would like to do with Quarkus, in the near future.