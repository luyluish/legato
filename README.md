# <p align="center"> **Legato: A Prolog Song Recommender**</p>

<p align="center">
  <a>
    <img src="https://www.alexanderpaczynski.com/chipmusic/commonimages/gifs/dancingnotes.gif" height=100/>
  </a>
</p>


Table of Contents
======================================
1. [Overview](#overview)
2. [Funcionality](#funcionality)
3. [Files](#files)
4. [Tech Used](#tech-used)


<a id ="overview"></a>

## 🎶 Overview

The following software was made as an assignment for the UFPB "Applied Computer Science Logic" course. In the referred assignemnt, each group was tasked to make a project written in Prolog, a programming language based on first-order logic.

Thus, **Legato** was born from the idea of using first-order logic to recommend songs for the user, based on another song they like.

<a id ="funcionality"></a>

## 🎵 Funcionality
In order to launch **Legato**, you will need to have an enviroment that runs Prolog files, such as SWI-Prolog. Once you have it installed, just consult the file **menu.pl** and the execution will start.

When first launching Legato, you will be greeted with a menu, asking whether you want to get a song recommendation or exit the program. The recommendation algorithm works as following:

Let's say you want a recommendation based on "The Adults are Talking" by "The Strokes".

- First, the program asks you for a song, so you input...
>the adults are talking
- Then, the program asks for the artist, you must write...
>the strokes

<h6>(Note that everything needs to be written in lower case, because that's how the songs are stored in the database file.)</h6>

- After that, the program will output a list with 5 songs remotely similar to the one you wrote.

<p align="center">
  <a>
    <img src="https://static.wikia.nocookie.net/dank_memer/images/4/48/Musical_Note.gif/revision/latest?cb=20220830163240" height=100/>
  </a>
</p>

<a id ="files"></a>

## 🎧 Files

- ``songs.pl`` contains the declaration of all 114.000 songs present in the Spotify dataset we based the project on. Each line is a different song.

- ``functions.pl`` contains all the main functions needed for the recommendation logic to work, such as the attribute proximity calculator.

- ``menu.pl`` is the main launch file, in which the user will interact with in order to get the recommendations. (Run this to use the program!)

- ``dataset.csv`` is the raw dataset we consulted in order  to create the songs list.

<a id ="tech-used"></a>

## 🌐 Tech Used

<a href="https://www.swi-prolog.org/"><img src="https://img.shields.io/badge/PROLOG-9e193d?style=for-the-badge" alt="PROLOG" />
</a>

<a href="https://www.python.org/"><img src="https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue"></a>
