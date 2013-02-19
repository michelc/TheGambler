# encoding: UTF-8

require "sinatra"
require "open-uri"

require "sinatra/reloader" if development?

get "/" do
  "Moteur de jeu développé pour participer au concours tournoyons.developpez.com"
end

get "/chifoumi" do

  # Récupération des données
  partie = params[:Game]      # Nom de la partie
  tour = params[:MoveId]      # ID du tour en cours
  arbitre = params[:Referee]  # URL pour répondre à l'arbitre

  # Calcul du coup à jouer
  coup = rand(1..3)

  # Envoie le coup à l'arbitre
  url = "#{arbitre}?Game=#{partie}&MoveId=#{tour}&Value=#{coup}"
  open(url).read.size
end
