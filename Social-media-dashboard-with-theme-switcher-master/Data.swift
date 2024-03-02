//
//  Data.swift
//  Social-media-dashboard-with-theme-switcher-master
//
//  Created by Marcos Fabian Chong Megchun on 29/02/24.
//

import Foundation

struct MainCard {
    let id = UUID()
    var imageSocial: String
    var username: String
    var numberFollowers: String
    var typeOfMembers: String
    var colorOfTextArrow: String
    var arrowImage: String
    var updatedSubscribed: String
    var Gradient1: String
    var Gradient2: String
    var hasGradient: Bool
}

struct OverviewCard {
    let id = UUID()
    var imageSocial: String
    var typeStatistic: String
    var numberOfType: String
    var percentage: String
    var colorOfTextArrow: String
    var arrowImage: String
}

var mainCardData = [
    MainCard(imageSocial: "icon-facebook", username: "@nathanf", numberFollowers: "1987", typeOfMembers: "FOLLOWERS", colorOfTextArrow: "Lime-Green", arrowImage: "icon-up", updatedSubscribed: "12", Gradient1: "Facebook", Gradient2: "", hasGradient: false),
    MainCard(imageSocial: "icon-twitter", username: "@nathanf", numberFollowers: "1044", typeOfMembers: "FOLLOWERS", colorOfTextArrow: "Lime-Green", arrowImage: "icon-up", updatedSubscribed: "99",  Gradient1: "Twitter", Gradient2: "", hasGradient: false),
    MainCard(imageSocial: "icon-instagram", username: "@realnathanf", numberFollowers: "11k", typeOfMembers: "FOLLOWERS", colorOfTextArrow: "Lime-Green", arrowImage: "icon-up", updatedSubscribed: "1099",  Gradient1: "Instagram", Gradient2: "Instagram02", hasGradient: true),
    MainCard(imageSocial: "icon-youtube", username: "Nathan F.", numberFollowers: "8239", typeOfMembers: "SUBSCRIBERS", colorOfTextArrow: "Bright-red", arrowImage: "icon-down", updatedSubscribed: "144",  Gradient1: "Youtube", Gradient2: "", hasGradient: false),
]

var overviewData = [
   OverviewCard(imageSocial: "icon-facebook", typeStatistic: "Page Views", numberOfType: "87", percentage: "3%", colorOfTextArrow: "Lime-Green", arrowImage: "icon-up"),
   OverviewCard(imageSocial: "icon-facebook", typeStatistic: "Likes", numberOfType: "52", percentage: "2%", colorOfTextArrow: "Bright-red", arrowImage: "icon-down"),
   OverviewCard(imageSocial: "icon-instagram", typeStatistic: "Likes", numberOfType: "5462", percentage: "2257%", colorOfTextArrow: "Lime-Green", arrowImage: "icon-up"),
   OverviewCard(imageSocial: "icon-instagram", typeStatistic: "Profile Views", numberOfType: "52k", percentage: "1375%", colorOfTextArrow: "Lime-Green", arrowImage: "icon-up"),
   OverviewCard(imageSocial: "icon-twitter", typeStatistic: "Retweets", numberOfType: "117", percentage: "303%", colorOfTextArrow: "Lime-Green", arrowImage: "icon-up"),
   OverviewCard(imageSocial: "icon-twitter", typeStatistic: "Likes", numberOfType: "507", percentage: "553%", colorOfTextArrow: "Lime-Green", arrowImage: "icon-up"),
   OverviewCard(imageSocial: "icon-youtube", typeStatistic: "Likes", numberOfType: "107", percentage: "19%", colorOfTextArrow: "Bright-red", arrowImage: "icon-down"),
   OverviewCard(imageSocial: "icon-youtube", typeStatistic: "Total Views", numberOfType: "1407", percentage: "12%", colorOfTextArrow: "Bright-red", arrowImage: "icon-down"),
]


