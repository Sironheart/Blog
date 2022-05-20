---
date: 2022-05-20
title: 'Parting ways with PHP'
hero: 'hero-image.png'
metaDescription: 'I moved from writing PHP for a living. What do I have left to say?'
---

It's been about 3 months now, since I searched and took a job as a kotlin developer. It has been a great risk but after 
this time I'm feeling comfortable to say why I took this different path.

## Writing PHP
PHP has become a great language. At least since I started writing PHP5.6 for a living. It has gotten quite fast, increased 
on language features and got even more robust. Yet, for me, PHP felt, once I started experiencing other modern languages,
as I could have written Java 6 or something in this neighbourhood.

## Shopware
My last PHP job was as a Shopware developer. Shopware is the best ecommerce framework I had the pleasure of working with,
yet it had a few major difficulties. Shopware started with PHP7.2 support, which will still be in use for as long as shopware
shops on these version exists (looking at you WordPress and PHP5.3). So as long as we do not want to break compatability
with previous versions of shopware, the payment plugins I participated in developing, need to remain compatible with this
old version. And not only the old Shopware/PHP versions, but also versions of other third-party-plugins, which are more spread 
in the shopware ecosystem.

Also, there is a huge problem with plugin quality in the shopware ecosystem. There are a lot of plugins out there, that were 
written as if an apprentice on his first day made it, and it just was moved to the shopware store. Of course there are a
lot of great plugins, but in my opinion the shopware AG itself, the company behind the Shopware Framework, does not matter 
about their own plugin quality. Needing to integrate one of their paid plugins made me lose way too much hair.

## MySQL
A lot of technologies are using MySQL, which isn't a problem in itself. But there are also a lot of legacy versions of MySQL,
which are still in use. The oldest version I met in the wild was a MySQL5.3.2! Having paying customers and still remaining 
on such old versions is a terrible practice I hope to not meet again! Some of these old MySQL versions were even reachable 
from outside the server, which calls for security and GDPR breaches.

## Parting ways
As I said I wasn't writing PHP for a living for 3 months now. But I started writing different languages around summer 2021.
I started out with C#, .NET (Core) and ASP.NET Core but since I wanted to take a look at Kotlin I moved away from those 
too.

Kotlin immediately felt so well-thought-out. There were so many tiny things I immediately fell in love with, like extension
functions, which allow you to define functions for existing objects without the need of Inheritance. Also, there are options 
to write one line functions as only one line. It just made sense!

```kotlin
// Example of inline functions and extension functions

fun String.party() = "🎉"
```

Moving with Kotlin I had a lot more other options available for me. Kotlin is a first-class-support language for Android
development, you can use the java ecosystem in a whole (which allows the use of the Spring Framework, just to give an 
example), and there are a lot of things from the Kotlin teams at JetBrains, which continue to expand the use of Kotlin.

There is [Jetpack Compose](https://developer.android.com/jetpack/compose) to write UIs on Android and in use with the 
[Kotlin Multiplatform](https://kotlinlang.org/docs/multiplatform.html) you are able to use these UIs on Desktop, Web and iOS
too.

Kotlin is compilable to Javascript (and Webassembly, which is still in early development), which allows for a fullstack 
Kotlin usage in the web. Also, there are frameworks like [KVision](https://kvision.io/) which try to make the development 
of Kotlin/JS even easier and fun.

Big frameworks, such as [Spring](https://spring.io/) and [Quarkus](https://quarkus.io/), even have modules to make the 
development of services with Kotlin more pleasant.

I can't express enough how much I have fallen in love with Kotlin. It's just the greatest language I have stumbled upon, 
and I'm feeling really lucky to have the opportunity switching my whole tech stack around Kotlin.

## Last words 
Even though I will not write any PHP code anymore, going further into the future, I'm really happy for what I was able to 
accomplish writing PHP. I was able to be part of the Shopware development in its early stages, I developed payment methods
for different payment distributor, I was able to sync hundreds of products from an ERP to Shopware... and there is so much 
more I was able to experience, because I started my career writing PHP. Not everything was good, but there sure as hell 
was a lot I have learned, on a professional and personal level. 

Thanks to everyone who was part of my previous journey and welcome to everyone I'll be able to get to know in the future.
There is still a lot to learn, and I'm looking forward to all these new experiences.