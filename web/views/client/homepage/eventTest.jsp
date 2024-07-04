<%-- 
    Document   : eventTest
    Created on : Jun 25, 2024, 4:58:42 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>


        <style>
            body {
                margin: 0px;
                font-family: Inter, sans-serif;
                font-weight: normal;
                color: rgb(42, 45, 52);
                min-height: 100%;
                font-size: 14px;
                overflow: auto;
                scroll-behavior: smooth;
            }


            .blpZnD {
                position: fixed;
                top: 28px;
                z-index: 9999;
                width: 100%;
                margin: auto;
            }

            .whitG {
                width: 100%;
                min-height: 100vh;
                background: rgb(245, 247, 252);
            }


            .lawBxk {
                display: flex;
                flex-direction: column;
            }

            .jcdSxR {
                width: 100%;
                display: flex;
                -webkit-box-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                align-items: center;
                background-color: rgb(45, 194, 117);
                height: 76px;
            }


            .ifTsZN header {
                position: initial;
            }


            @media (min-width: 1024px) {
                .hBhvmv {
                    max-width: 1275px;
                    padding-inline: 0.5rem;
                }
            }
            @media (min-width: 768px) {
                .hBhvmv {
                    max-width: 720px;
                }
            }

            .hBhvmv {
                display: flex;
                gap: 1.4rem;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: justify;
                justify-content: space-between;
                z-index: 10;
                width: 100%;
                height: 76px;
                padding-block: 1rem;
                padding-inline: 1rem;
                background-color: rgb(45, 194, 117);
            }
            .eUzvQp {
                width: 180px;
                height: auto;
            }

            element.style {
                align-items: center;
                gap: 1.5rem;
            }
            .eQuqEb {
                display: flex;
            }


            .eOdBXI {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                background-color: rgb(255, 255, 255);
                min-width: max-content;
                width: 35%;
                padding: 0.5rem 1rem;
                border-radius: 0.4rem;
                position: relative;
            }

            .hBhvmv a {
                text-decoration: none;
            }
            @media (min-width: 1440px) {
                .dmblPO {
                    font-size: 1em;
                }
            }

            .dmblPO {
                color: rgb(255, 255, 255);
                border: 1px solid rgb(255, 255, 255);
                border-radius: 2rem;
                padding: 0.6rem 2.2rem;
                font-size: 0.8em;
                font-weight: 400;
                transition: all 0.4s ease-in-out 0s;
                height: max-content;
            }


            @media (min-width: 1440px) {
                .jVrJkv {
                    font-size: 1em;
                }
            }

            .jVrJkv {
                color: rgb(255, 255, 255);
                display: flex;
                cursor: pointer;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                gap: 0.75rem;
                position: relative;
                font-size: 0.9em;
            }

            .hBhvmv a {
                text-decoration: none;
            }
            .jVrJkv a {
                display: flex;
                flex-direction: row;
                -webkit-box-pack: center;
                justify-content: center;
                gap: 0.5rem;
                -webkit-box-align: center;
                align-items: center;
            }

            element.style {
                display: flex;
                align-items: center;
                gap: 1rem;
            }

            .ctOWEK {
                position: relative;
                height: 72px;
            }

            .fYSkyu {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }

            @media (min-width: 1440px) {
                .bMeMKg {
                    font-size: 1em;
                }
            }

            .bMeMKg {
                font-style: normal;
                line-height: 20px;
                cursor: pointer;
                transition: background-color 0.4s ease 0s;
                color: rgb(255, 255, 255);
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                gap: 0.5rem;
                padding: 0.6rem 1rem;
                border-radius: 0.5rem;
                font-size: 0.9em;
            }
            .fYSkyu {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }


            .jDWmyp {
                border-radius: 50%;
                width: 1.5rem;
                height: 1.5rem;
                object-fit: cover;
            }

            .kcCDCt {
                box-shadow: rgba(42, 45, 52, 0.16) 0px 4px 20px;
                border-radius: 0.5rem;
                position: absolute;
                top: 4rem;
                right: 0px;
                z-index: 1;
                background: rgb(255, 255, 255);
                width: 11rem;
                overflow: hidden;
                display: none;
                cursor: auto;
                font-style: normal;
                font-size: 0.875rem;
                line-height: 20px;
                transition: background-color 0.4s ease 0s;
            }

            .fiLbFZ {
                position: relative;
                height: 4.5rem;
            }
            .ghYYae {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }

            .fqJZWI {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                cursor: pointer;
                padding: 0.6rem 1rem;
                border-radius: 0.5rem;
                transition: background-color 0.4s ease 0s;
            }

            .ghYYae {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }


            .fiLbFZ .flag-icon-container {
                background-color: rgb(216, 40, 38);
                width: 1.5rem;
                height: 1.5rem;
                border-radius: 50%;
                overflow: hidden;
            }

            .fiLbFZ #dropdown-icon {
                margin-left: 8px;
            }

            .jRgsFx {
                box-shadow: rgba(42, 45, 52, 0.16) 0px 4px 20px;
                border-radius: 8px;
                position: absolute;
                top: 64px;
                right: 0px;
                z-index: 1;
                background: rgb(255, 255, 255);
                width: 8.125rem;
                overflow: hidden;
                display: none;
                cursor: auto;
                font-style: normal;
                font-size: 14px;
                line-height: 20px;
            }

            .ifTsZN header {
                position: initial;
            }

            .jHXUVU {
                z-index: 10;
                width: 100%;
                height: 76px;
                background-color: rgb(45, 194, 117);
                display: none;
                padding-block: 1rem;
                padding-inline: 1rem;
            }

            .ifTsZN main {
                margin-top: 0px;
            }
            .imfxcL {
                margin-left: 0px;
            }

            main {
                display: block;
            }
            *, ::before, ::after {
                box-sizing: border-box;
            }
            user agent stylesheet
            main {
                display: block;
                unicode-bidi: isolate;
            }

            .jKvuHi {
                overflow-x: hidden;
            }

            .bRCsbQ {
                width: 100%;
                height: 3.75rem;
                background-color: rgb(0, 0, 0);
                position: relative;
                padding-inline: 1rem;
            }

            @media (min-width: 1440px) {
                .tbox-container {
                    max-width: 1280px;
                    padding-left: 16px;
                    padding-right: 16px;
                }
            }

            @media (min-width: 1024px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 12px;
                    padding-right: 12px;
                }
            }
            @media (min-width: 768px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 12px;
                    padding-right: 12px;
                }
            }
            @media (min-width: 640px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 8px;
                    padding-right: 8px;
                }
            }
            .tbox-container {
                box-sizing: border-box;
                position: relative;
                margin-left: auto;
                margin-right: auto;
            }

            .bRCsbQ .content {
                width: 100%;
                height: 3.75rem;
                padding-inline: 1.75rem;
                gap: 2rem;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                overflow-x: hidden;
                scroll-snap-type: x mandatory;
            }

            .dZdRWp {
                color: rgb(255, 255, 255);
                transition: color 0.2s ease-in-out 0s;
                margin-block: auto;
                scroll-snap-align: center;
                flex-shrink: 0;
                cursor: pointer;
            }

            .iVXoTn {
                width: 100%;
                height: max-content;
                padding-block: 2rem;
                padding-inline: 1rem;
                background: linear-gradient(rgb(39, 39, 42) 48.04%, rgb(0, 0, 0) 100%);
                color: rgb(255, 255, 255);
            }


            .iVXoTn .content {
                width: 100%;
                height: 100%;
                padding: 0px;
                color: white;
                border-radius: 1.5rem;
                background: linear-gradient(rgb(39, 39, 42) 48.04%, rgb(0, 0, 0) 100%);
                overflow: hidden;
            }

            @media (min-width: 1024px) {
                .jKvuHi .desktop {
                    display: flex;
                }
            }
            .jKvuHi .desktop {
                display: none;
            }
            @media (min-width: 1440px) {
                .tbox-container {
                    max-width: 1280px;
                    padding-left: 16px;
                    padding-right: 16px;
                }
            }
            @media (min-width: 1024px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 12px;
                    padding-right: 12px;
                }
            }
            @media (min-width: 768px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 12px;
                    padding-right: 12px;
                }
            }
            @media (min-width: 640px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 8px;
                    padding-right: 8px;
                }
            }
            .tbox-container {
                box-sizing: border-box;
                position: relative;
                margin-left: auto;
                margin-right: auto;
            }

            .iVXoTn .content .text-wrapper {
                flex: 1 1 0%;
                background-color: rgb(56, 56, 61);
                position: relative;
                padding: 1.875rem;
            }

            .iVXoTn .content .text-wrapper #circle1 {
                top: 0px;
                right: 0px;
                transform: translate(1.875rem, -1.875rem);
                background-color: rgb(39, 39, 42);
            }

            .iVXoTn .content .text-wrapper .circle {
                position: absolute;
                width: 3.75rem;
                height: 3.75rem;
                border-radius: 50%;
                z-index: 12;
            }

            .iVXoTn .content .text-wrapper #circle2 {
                bottom: 0px;
                right: 0px;
                transform: translate(1.875rem, 1.875rem);
                background-color: rgb(2, 2, 3);
            }

            .iVXoTn .content .text-wrapper .circle {
                position: absolute;
                width: 3.75rem;
                height: 3.75rem;
                border-radius: 50%;
                z-index: 12;
            }

            .iVXoTn .content .text-wrapper #vertical-dashed {
                position: absolute;
                right: 0px;
                bottom: 4px;
                z-index: 10;
                transform: translate(2px, -4.4rem);
            }
            *, ::before, ::after {
                box-sizing: border-box;
            }


            .iVXoTn .content .text-wrapper #vertical-dashed-2 {
                position: absolute;
                right: 0px;
                top: 100%;
                z-index: 10;
                transform: translate(2px, -4.4rem);
            }

            .iVXoTn .content .text-wrapper .text {
                width: 100%;
                height: 100%;
                display: flex;
                flex-direction: column;
                -webkit-box-pack: justify;
                justify-content: space-between;
            }

            .iVXoTn .content .text-wrapper .text .info {
                display: flex;
                flex-direction: column;
                -webkit-box-pack: center;
                justify-content: center;
                overflow: hidden;
            }

            .iVXoTn .content .text-wrapper .text div {
                width: 100%;
            }

            @media (min-width: 1440px) {
                .iVXoTn .content .text-wrapper .text .info #title {
                    font-size: 18px;
                }
            }

            .iVXoTn .content .text-wrapper .text .info #title {
                font-size: 16px;
                overflow: hidden;
                word-break: break-word;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 3;
            }

            .iVXoTn .content .text-wrapper .text .info #date {
                margin-top: 1rem;
            }

            .iVXoTn .content .text-wrapper .text .info #venue {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                margin-top: 1rem;
            }

            .iVXoTn .content .text-wrapper .text .info #location-icon {
                transform: scale(0.65) translateX(-0.4rem);
            }

            .iVXoTn .content .text-wrapper .text .info span {
                color: rgb(45, 194, 117);
                font-weight: bold;
            }

            .iVXoTn .content .text-wrapper .text .info #address {
                font-size: 0.8em;
                color: rgb(196, 196, 207);
                margin-left: 1.5rem;
            }

            .iVXoTn .content .text-wrapper .text .price {
                border-top: 1px solid rgb(196, 196, 207);
            }
            .iVXoTn .content .text-wrapper .text div {
                width: 100%;
            }

            @media (min-width: 1440px) {
                .iVXoTn .content .text-wrapper .text .price #ticket-price {
                    font-size: 18px;
                }
            }
            .iVXoTn .content .text-wrapper .text .price #ticket-price {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                gap: 0.5rem;
                padding-block: 1rem;
                font-size: 16px;
                font-weight: bold;
            }

            .iVXoTn .content .text-wrapper .text div {
                width: 100%;
            }


            .iVXoTn .content .text-wrapper .text .price #ticket-price #price-value {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                gap: 0.5rem;
                color: rgb(45, 194, 117);
            }


            .iVXoTn .content .text-wrapper .text .price #ticket-price #price-value svg {
                margin-left: 0.5rem;
            }

            .bHHstD {
                width: 100%;
                padding-block: 0.5rem;
                border-radius: 0.25rem;
                font-weight: bold;
                transition: background-color 0.4s ease-in-out 0s;
                color: rgb(255, 255, 255);
                background-color: rgb(45, 194, 117);
            }
            button {
                background-color: transparent;
                color: inherit;
                border-width: 0px;
                padding: 0px;
                cursor: pointer;
            }

            button, [type="button"], [type="reset"], [type="submit"] {
                appearance: button;
            }
            button, select {
                text-transform: none;
            }
            button, input {
                overflow: visible;
            }
            button, input, optgroup, select, textarea {
                font-family: inherit;
                font-size: 100%;
                line-height: 1.15;
                margin: 0px;
            }


            .iVXoTn .content .img-wrapper {
                flex: 2 0 0%;
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: center;
                justify-content: center;
                overflow: hidden;
                background: linear-gradient(rgb(39, 39, 42) 48.04%, rgb(0, 0, 0) 100%);
            }

            .iVXoTn .content .img-wrapper img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center center;
            }

            @media (min-width: 1024px) {
                .jKvuHi .mobile {
                    display: none;
                }
            }

            .jKvuHi .mobile {
                display: flex;
            }
            .blMcst {
                width: 100%;
                height: 100%;
                position: relative;
                overflow: hidden;
            }


            .blMcst #bg-wrapper {
                z-index: 2;
                position: absolute;
                width: 100%;
                height: 100%;
                filter: blur(10px) brightness(0.4);
            }

            .blMcst #bg-wrapper img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .blMcst #banner-info-wrapper {
                width: 100%;
                height: 100%;
                z-index: 5;
                padding: 0.75rem;
                position: relative;
            }

            .blMcst #banner-info-stack {
                display: flex;
                flex-direction: column;
                -webkit-box-align: center;
                align-items: center;
                overflow: hidden;
                width: 100%;
                height: 100%;
                border-radius: 0.5rem;
                background-color: rgb(42, 45, 52);
            }

            .blMcst #banner-img-wrapper {
                width: 100%;
                height: 100%;
                overflow: hidden;
            }

            .blMcst #banner-img-wrapper img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center center;
            }

            @media (min-width: 768px) {
                .blMcst #banner-info-content {
                    padding: 1rem;
                }
            }

            .blMcst #banner-info-content {
                width: 100%;
                background-color: rgb(42, 45, 52);
                padding: 0.75rem;
            }

            @media (min-width: 768px) {
                .blMcst #banner-info-content #title {
                    font-size: 18px;
                }
            }

            .blMcst #banner-info-content #title {
                font-size: 16px;
            }
            .blMcst #banner-info-content p {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }
            @media (min-width: 768px) {
                .blMcst #banner-info-content #date {
                    font-size: 1rem;
                }
            }

            .blMcst #banner-info-content #date {
                font-size: 0.75rem;
                margin-top: 0.75rem;
            }
            .blMcst #banner-info-content p {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }

            @media (min-width: 768px) {
                .blMcst #banner-info-content #venue {
                    /* font-size: 1rem; */
                }
            }

            .blMcst #banner-info-content #venue {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
                margin-top: 0.5rem;
                font-size: 0.75rem;
            }
            .blMcst #banner-info-content p {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }

            @media (min-width: 768px) {
                .blMcst #banner-info-content #address {
                    font-size: 1rem;
                }
            }

            .blMcst #banner-info-content #address {
                font-size: 0.75rem;
                color: rgb(196, 196, 207);
                margin-left: 1.5rem;
            }
            .blMcst #banner-info-content p {
                display: flex;
                -webkit-box-align: center;
                align-items: center;
            }

            @media (min-width: 1440px) {
                .tbox-container {
                    max-width: 1280px;
                    padding-left: 16px;
                    padding-right: 16px;
                }
            }

            @media (min-width: 1024px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 12px;
                    padding-right: 12px;
                }
            }
            @media (min-width: 768px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 12px;
                    padding-right: 12px;
                }
            }
            @media (min-width: 640px) {
                .tbox-container {
                    max-width: 100vw;
                    padding-left: 8px;
                    padding-right: 8px;
                }
            }
            .tbox-container {
                box-sizing: border-box;
                position: relative;
                margin-left: auto;
                margin-right: auto;
            }

            @media (min-width: 1440px) {
                .tbox-row {
                    margin-left: -16px;
                    margin-right: -16px;
                }
            }
            @media (min-width: 1024px) {
                .tbox-row {
                    margin-left: -12px;
                    margin-right: -12px;
                }
            }

            @media (min-width: 768px) {
                .tbox-row {
                    margin-left: -12px;
                    margin-right: -12px;
                }
            }
            @media (min-width: 640px) {
                .tbox-row {
                    margin-left: -8px;
                    margin-right: -8px;
                }
            }
            .tbox-row {
                display: flex;
                flex-wrap: wrap;
                -webkit-box-flex: 0;
                flex-grow: 0;
                flex-shrink: 0;
            }


            @media (min-width: 1024px) {
                .tbox-col-lg-9 {
                    flex: 0 0 75%;
                    max-width: 75%;
                    padding-left: 12px;
                    padding-right: 12px;
                }
            }
            [class*="tbox-col-"] {
                box-sizing: border-box;
                min-height: 1px;
                width: 100%;
            }


            .jfchvt {
                width: 100%;
            }

            .eYXroU {
                border-radius: 12px;
                margin-top: 25px;
                padding: 0px 1rem;
                background-color: rgb(255, 255, 255);
                overflow: hidden;
            }

            .eYXroU #title {
                padding: 0.75rem 0px;
                border-bottom: 1px solid rgb(235, 235, 240);
            }

            .eYXroU h4, .eYXroU div {
                color: rgb(39, 39, 42);
            }
            .kYOHji {
                margin-block: 0px;
                font-weight: 600;
                font-size: 1rem;
            }



            .eYXroU #content {
                padding: 0.75rem 0px;
                margin-top: 24px;
            }

            .eYXroU h4, .eYXroU div {
                color: rgb(39, 39, 42);
            }
            .giRCXh {
                position: relative;
                overflow: hidden;
                transition: height 0.6s ease 0s;
            }

            .eYXroU h4, .eYXroU div {
                color: rgb(39, 39, 42);
            }
            .czloHV {
                padding-bottom: 30px;
                line-height: 1.5;
            }

            ul, ol, dd {
                margin: 0px;
                padding: 0px;
                list-style: none;
            }

            .eYXroU h4, .eYXroU div {
                color: rgb(39, 39, 42);
            }
            .gwbOAe {
                position: absolute;
                width: 100%;
                bottom: 0px;
                height: 120px;
                background: linear-gradient(rgba(255, 255, 255, 0) 0%, rgb(255, 255, 255) 100%);
                z-index: 3;
            }

            .eYXroU h4, .eYXroU div {
                color: rgb(39, 39, 42);
            }
            .emSsxZ {
                position: absolute;
                z-index: 4;
                text-align: center;
                width: 100%;
                padding: 10px 0px;
                bottom: -20px;
                cursor: pointer;
            }

            .emSsxZ svg {
                transform: rotate(0deg);
            }

            .izBMvV {
                border-radius: 12px;
                margin-top: 25px;
                padding: 0px;
                background-color: rgb(39, 39, 42);
                overflow: hidden;
            }

            .izBMvV #title {
                padding: 0.75rem;
                border-bottom: 1px solid rgb(0, 0, 0);
            }

            .izBMvV h4, .izBMvV div {
                color: rgb(255, 255, 255);
            }
            .kYOHji {
                margin-block: 0px;
                font-weight: 600;
                font-size: 1rem;
            }
            .izBMvV #content {
                padding: 0px;
                margin-top: 0px;
            }

            .izBMvV h4, .izBMvV div {
                color: rgb(255, 255, 255);
            }

            .kDlFFy {
                width: 100%;
                overflow: hidden;
            }

            .kDlFFy div.ant-collapse {
                overflow: hidden;
                border: none;
                border-radius: 0px;
            }

            .kDlFFy .noselect {
                user-select: none;
            }

            .kDlFFy div.ant-collapse div.ant-collapse-item {
                border-bottom: 1px solid rgb(0, 0, 0);
            }

            item:last-child>.ant-collapse-header {
                border-radius: 0 0 8px 8px;
            }
            .kDlFFy div.ant-collapse div.ant-collapse-header {
                color: rgb(255, 255, 255);
                border-radius: 0px;
                font-weight: bold;
                text-transform: capitalize;
            }


        </style>




    </head>
    
     <c:set var="event" value="${requestScope.event}" />
        <c:set var="area" value="${requestScope.area}" />
        
        
    <body class="tbox-desktop-os">
        <div id="__next">
            <div class="Toast__Container-sc-uw10cx-0 blpZnD"></div>
            <div class="event-detail__WrapperEventDetail-sc-9s4sm8-0 ifTsZN">
                <div class="Container__FlexColumn-sc-17x1kk6-3 Layout__Wrapper-sc-1x9m3gv-0 lawBxk whitG">
                    <div class="Header__Wrapper-sc-qhadgg-1 dnBxdA">
                        <div id="header-main-wrapper" class="Header__HeaderMainWrapper-sc-qhadgg-0 jcdSxR">
                            <header class="style__Wrapper-sc-at0dtu-0 hBhvmv">
                                <a href="https://ticketbox.vn" title="Ticketbox" class="style__LinkLogo-sc-at0dtu-1 eXbNXV">
                                    <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTc5IiBoZWlnaHQ9IjMyIiB2aWV3Qm94PSIwIDAgMTc5IDMyIiBmaWxsPSJub25lIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIj4KPHJlY3Qgd2lkdGg9IjE3OSIgaGVpZ2h0PSIzMiIgZmlsbD0idXJsKCNwYXR0ZXJuMCkiLz4KPGRlZnM+CjxwYXR0ZXJuIGlkPSJwYXR0ZXJuMCIgcGF0dGVybkNvbnRlbnRVbml0cz0ib2JqZWN0Qm91bmRpbmdCb3giIHdpZHRoPSIxIiBoZWlnaHQ9IjEiPgo8dXNlIHhsaW5rOmhyZWY9IiNpbWFnZTBfODU4Nl8xMzY3ODUiIHRyYW5zZm9ybT0ibWF0cml4KDAuMDAyNjA0MTcgMCAwIDAuMDE0NTY3MSAwIDAuMDMzODU0MikiLz4KPC9wYXR0ZXJuPgo8aW1hZ2UgaWQ9ImltYWdlMF84NTg2XzEzNjc4NSIgd2lkdGg9IjM4NCIgaGVpZ2h0PSI2NCIgeGxpbms6aHJlZj0iZGF0YTppbWFnZS9wbmc7YmFzZTY0LGlWQk9SdzBLR2dvQUFBQU5TVWhFVWdBQUFZQUFBQUJBQ0FZQUFBQVRXS0MvQUFBQUNYQklXWE1BQUFzVEFBQUxFd0VBbXB3WUFBQUFBWE5TUjBJQXJzNGM2UUFBQUFSblFVMUJBQUN4and2OFlRVUFBQkRhU1VSQlZIZ0I3WjMvZGR3MkVzZkg5KzcvMDFVUXBBTExGUnhkUWV3S3ZLbmdsQXFXcnNCMkJWSXFzRkxCcml1d1VnRjVGY2lwNEh1Y0FHc3hHKzVpQnI5SXJ2QjVqMCsyQk9JWE1aakJ6eUZTQU9CbWVEcFlIb2ZuZG5nTVpXWkk0ODN3N0Z5YXhkSmRDa05acjRabk82cjdyOE96b2Nyc2NEc2N0YzFpMzhhMWlZKzFUVlNLTURTdUQ1aW15OWtadTQ1dkNoYTRhN3B3WEFmVG5haUR6MVNaRGZkdEhrOThteTFsd3RNbWJxbFNTUWxiRmpqUGpqSXd4TnQ0MHUzb3dobktlT2VwZzVZcXMzQ21FejdRVUFaZ1J4em4yRkNsa2dwQmcyTU1KVWJRK1dVVHNpVUFPOHozY2ZGS2NJbkFiNXd3eWExeFdPdmZSeGFEckhKNS9FTVk3a2RCR0VQcCtVRVF4dERsY2lVSVk2Z3lCMFlRUmlJM09kS1ZoS2xVeEFwZ0x2NFFoT21wVXFsVUttcVdyZ0R1UEgvdlg3eDRzYWRLcFZLcHFGbTBBaGc2OS92aHgvNU1rRitvVXFsVUtrRXNmUVRBU3VEMThPUDk4SHdiL2ZwaGVGNDdCVkdwVkNxVkFQNUpLMkRvNk52aFJ3dTMwMmo0ZjArVlNxVlNpV0lWQ3VCQTdmZ3JsVW9sSFl1ZkFxcFVLcFZLSHFvQ3FGUXFsV2RLVlFDVlNxWHlUS2tLb0ZLcFZKNHBWUUZVS3BYS00rWDdMaUMrZUd6NHNSbWVseFBoL2tWK3RrTWM3NDUrOTcvaDJjZWUxblY1ZTBOUGQ1emNEM0UrVUVGY0hocXk5L09Zb3ovekdZV2U3TW5rb3ZrcXdhait1WndQSlhaanVUVE44RnpUOU4wMkQ2UDhmS05NdU1zR3VlekhNbUFFcjcrY3VCQ09yemZodk8vbjN0WG02dmhRdi96dy83bWNuTWZ2YlpveTEzRU9Kc28ycHJpOHVuYlV1UDlHOTRuS3RBOTlPLy9zNmJqdHdUcDZlVVErYmwwbVFqSi9qZWxyZHo5UVptQnZmUHdJLzdXL1k3Z2VkN0JYYUJ1S0FMS2JIMEdaZ0wyTjlFUEs3K2xKajcvMUZyTGJaOGZzWUwrVG9VVGd5ZEZMTHJyaGVhUE1sdlFXMHM3ei9oYldnWXdHRHM5MXZGZ2ZISmhaWGsvazZWUTc2b0FpenJTbStuWk8rOTBoZ0tSQnBVRHR2QVRuSFY4d3laVUFucnh2cFZLSXR3ajgwSmhSQWNDMmkrNU1zc211SEhacDdaQ0dKSjZ4a0xmekg2UHFVQkdvQUdBN3VCM1NzQmp2WThnanJ3MGxBdWNWTGY4dHVTRTFTdnZHVTlhbVpFTm50STI5RmNTWnJBS1J0aUVkY3d1bElzQU1DZ0NucmY0cEdvb0F0alBUV3FKU09nUjJVaWhuRkRHcTYweWdWQUR3Sy9JWU9zeW9DSkIzNXVJejRrZndzL2lNY0dsZkM5TGVFY3F5VVJaaWx6ck9NNVdWcXlNNlJ1d3FFSVVWQUt6dlpZMUFmYVFBWUpYTVo1VGhGbnJGS3pFOFVxRnk2QU9oQWtEK0thd3h0eWpvb3hzTGxkZUpmRXJiVVZMM29mRFBuQng0NUYxQXExcmNTYzFRQ1RmRGo2OWtGNHhLd0kyQ0c2K2hoUURYSVEvLzVFY3pvcEpzRGpoT2krdVo2MXM5L3gzSVpuaDIwSTArMXk0VC9BMTVpcTZoTW14SVg4ZEJPSG5sc3BXVTF5Nnp2SElhU2VRQmRrYUU2OGNJZ2wreEFpaXlDdTdZMDRKd21qZjdZdklFM0hoM1MxQUNydUd4RlJyU0FMOW9Bc011UEVrYlowck04SHgxblllRXRjdkUxRTYxM0JqUzFiR2FrYnhtbXpjL2dhRXdlZDByd3Q0bTZnKzRqb3d3N0plUzg1M3F1UzVrbkFLQ0hiYk9UWWN6YXhqSU9BV0UrQ21DRG9vR080UjloMlVnR202ajNQU0pJUVVvdXo0UlN0SXBEVmZ1TGVhSHAwZTE2NWlhcWFvT0VXdWEwTmZSNXZDaWI3VTRsajBDQ29aTUNnRExhRXdITm1meW1VVUJJSDd4VENVSXNHc0xTK0tkSU05Yzl6bm5tYmtPTjZRRTYxQUF6RHRLQkpZbHIvemRqQ0x2QmpwWkM5cGRCNzJNdGZ6ZW53ZkJYcng0d1h0bmVUY0NUd05NQ2ZaUDVCOTIvVVovbnp2bC85OHZ5VzBqckhYU1VqaDh1TzF3Q0ltNWNzOS9LSXhpKzZwZHcrV1JXRVBoOExUUFJucUlhWlJtS0Z6UHY5TmZmVDhic2djV1E2MGxidSsvbnpzRTVNcjNDbmFLckpsSTZ3ZnkxMk5QMDlOa25PN2RnZzVYSGJkcHhwQXRvNkV3dkhVc0FYWktxYVZ3VHNscmFQdjVjNDU5eU5jcnlmZmpkalNFZlV0MjZsTUNLL2dQdzN0aWI0Y0JNbmJ2Zkt5SUUrZ0ZHcVdoeENEeENBQkNpM29DSHNGczRCbkZ3RnBuZDlEUnh1YVhaR1ZQWWZWdlNBbkN0aUJ5V2kwOGxoYnNicENid0RRNnhBMjNONEkwOXBRWXBCc0JkSkRWTWJmQnVlbzRSbDV2SUpmWEVMbFFuV3VDZnBaRnRKWUMrWTZmQXh4VzkwMXdPUXFnZzQ1OVNMbGdQNHBVRVRTZWVMd0k4ckpESEx4bE0yUUtid3NkTEloQmk0aXdIWElISGNFYkFMQmVCZEFoZk4yc2RCMTMwTUZUZGcwcGdaV1JGbnBVR3lkZ1R5bHI4TTRPUUNmYkhVSVdtbkVCQ2dDWk5MQW5UWjkyL2lwNDN3dWRMM09zMVIreU95akVlbU5sRzdXN3c2V3BQVi9RVUFCWXB3SmdvMlFWZFF4Wi9ZNzVTSkZBYjAyemZLanFFL3BGWVhNbXJpMTBoRTAzWStVS0FQb1A2NDFUVVlaVGk0bmM0Um5CdTE1T3ZMZERITGVJRzc1TFIwQk10UEFlcGQwcTBnNWRkRnViQW1ncEljaGN4MWlldkNKRnZVTGZGMDFlRndHOVFkdFNLRmkvQXRCWUU5NzRBc3ZDZ3R1NnB4RytvMVlBaUxmNk84UmY4U0RLdHlOcDV6L0tnMmE0M1pBU3JFc0J0SlNCWEhVTW5id21QM2NBZXpCU3FnUkNSZ0hYME1ubzdjVDdHdUprRE90WEFCMWt0TFFnb0ZBQVNHUDFzMEJISDdLQjNQcFhYWU1Ra0krZE1COGhaMVRXb2dEMmxCRkZIWXM3SVN4QVhxSGJ2cWxXUXRCUGNXMUgrZW9VNzMybFdMQmlCUUM1d0dUdGpFS0EzSktlM2VvL3luY25UTmRRUmlBWDRoQXJiZzBLUUxWblBUQS9TZXNZQzVKWHlEdnAwR25FRmpvNFA1MGlQSWMxNS9Md0hEeUNiWVRoWHRONmlUa2UvMmw0WHFVNnF3R3JTSXdnNkYxdWh5Z3UvaytDb0FlSE41ZkdwNFhWc1dRUlV2b2R4UHZrUXhuS2RrZXk2eHhZYWFubHorM0YvMVh4Q285VWpUQXNuMUY0N2Z2K3owRUJ2QlNFK1RLM2Q2WVo2TWsya0p2RUI1S2tBdnlleXNCVEQ1THloZTJRV0RaM1ZBYnA5STZrYlVnT1ZMSW5yM3NxZzdTZGhob1FQSDNVVTNwK2tmUnBGNjBBOE9RV3pzY2RQVDkrem5SQ1c2SndmeXVsY0oxeWV4QUUvWWt1aTd2Q2Rid1hCRDNidVN2a3RaVHhRRTVHc2hrUXJ1NWVVOW9iYU4rNzBZdVhTeDhCU0Q5S0tXdGlTZHdpei95d3BNNUwxN2RrbUczb3N2aU55aUpKejNqK0xwWFhQWlVsUmRsTzRoVDFXMHFENnBxSFMxY0FSaEJtZFE2dkUyRW83bzZlditFc09NbGM2QzBLSWkwbk1QLzEzQW5wcVN3U3BYN2xxV05KMi9rMnczU3RaQVFwR2ZtZXhJMDBZdGMxK3VINVdmTkNWUUQyc3FqbkNpOWVwZlNIWUdqZEdMb1FZaTloQzBpdkZ3WTkxOGtiOHZNN2xVZFNsNFlpNFVzNVNiYWdQa1ZQZGsxUFpjdytoMFZnSDQvMHZPRXRwS2wyd0VTZklhZ2tvYWQ1a0hRK1Y0Ri8wNlNSbXA0S3dac3lLR3lLNjIzSXlLZ3FnTXVFTFJhTkpYRjdZZE1mbFhuNGcvTHpIQXkyUGVub0tWQkpWUVZ3ZWZBT2dGZEtTK0p3eDNtc0JmOGMxMUtXeUZ3anNSOG9QLyttOGhncUJPeUZiUzNwTUJUbzJ2YlNGY0J6MnYvTmprZGVIZTBBNEowRnZmQjlRL0gra2Rlc0FQb2xPUzQ2UXk4SWM1VkFtYXRRcE5jSC91MUFDU1Z6VEpHcEtUY0tWL2taR01HbmhOV3VPS3NDdUl5RlB6NzAwUnd2L0xrRklWWUMwc2JKamVpR0FsbjVZVHJOaWN3NWtYN0wwb2FOS0QxUEd4RVpiS1dWRzhrODZQVVVnU3NUWHlsaEtKeFd1NTUzNlFwZ0x3akQxbEpESzhidEhqajFOMVlLbW9Nekh4QjZiN2hsamJ1cWZsVzV5SnNScDlRbGRkeFFXVGFDTUErUmZ6OVFXcmxKdG5qR3RudTIzZzNGbzFyUHUyZ0Y0S3dOaVZXUmFoZk1JZ25ZWHZZNVlsRjRUK3VCcDgzNFJQU0cxc1ZlRUNhWlUzWWhraXNjem5hU1M1UlhKd2VOSU9pZUFuRlROOEVqN3lOVTYzbi9wTXVIcllyR0UrYmRVR0h0SlI4STQwWGhvWXdzcEJMcnlaQTlQQlZ5UWQ2ZVpKMFBIM3E1cC9uNHR1THZ6VzNhVjhkOFMyZFRZbDBEOWtaZUl3Z3ErZDU4NnRaWHRwTHkyZ3JEN1NrQU4yWFRVbG9NMmJXRU5CZGNZdDNYUVVzOTU3UzBNSkRRS2Z3b1BzMjEwZXBGWVZobkdoSVdkLzIyQnN4MEhiUkxXM3BOZU5BMXhRSDU2WVQ1TVlLNHBGY3dwenpBZUNvdjBub09hc3ZReTZQR1U1bW9qcDdETnRBN1liZ3Q0dWErRjAvQW5TUHFRMktLaThHNDhiZFVVZU8rNDE0UWxFOTZwNXBhbUFSMitzSUlnbjRSYmhMZ1VZTEVzdWUyMlZCZVdtRzRQU21CVllhc29EVzdwOWlpMTF3WGNaUGsrMlA5SHNFazhUQWR5dTh3T0FrU2p3Qkc4V29jVWFpZGlrRG50S1NoRllJWlJ3Q0s5QTlrTVd5R2VOOG84ckJSeEN0MU5ka2gwd0ZHNkJ5dUcxSUNuZmUrYnB3R2RLNDRtYmp2RDVrQ1NMNHdnM1FLUU5NaFRUcGhqaXpIbTZPeWZJWGNtYjBYQ21CNDdUUGtkTkI3ek9xRWNiT0NXZDNJQzdJT09ONGQzK24wcnlDZlBranVHUXc2djdhcUtSTE1MNjhhaCtzaDdrUzMwSEU5RWNkTzhYNkhtTzhQMmR4VDhxRW1FaWtBUlZ4cEt1eXY2VzRSV0dmSXF3Q3VvSE12cDJybzBGbW8zSkdzYWljV1pOWnYxbXNMb091b2t0WHhFTTg3Nk9hdU42UUVlZ1BGVUFLZzc1eU5NbjdOTjJQYUUvRVlLSDBESTFSUlF1YmtPL21pSHRJcUFGRm5PaTRQQWhydVVYbzdUeHBuL2FRaW93Snc4V3VzT0VhbDVLRjNVczluRUF3RkFLdlFXTGcrdTNRL0F2bnVONEs4UFcwb0k5QXZERzRSMkJHNE92NEFIYVVXU0R2a2w5ZGp0RWJSdFM1NmZCVEVwNm1qc092ZklkZGFTVmZta1ZBQnVQaGE2QkZOMTR6UzRJOGlVWmdIYnM3RWxWVUJ1RFMwRmttamlGdmJRSmtPZHZSZ2hHbHdwN1E5a1E3L0x0dCtlTWlkb1J2S0JIVFRKVG5xMkljb2pSUHBhdHZtOTdJcDBqQ0JaZXMwWlVPQXhTNk1WelBTWnY1eVhjUUxZU0lOMlJWckNUM1prNmU4VjNscU5WKzgveHAyRzF2akNmYXoxUDJaSXM0cGVyS3IvWHdmK2FGcy9CajM4RHpkeTRDNDJYWGZwQk1IMThDOEZ0VHd2dWc3bmdMVzB2aXZNSGhQQW1mVG83aFp3WVVhQm51eWg3VU85ZDJUM1RWaDNNTnVISy9wL0U0S2Z1L0hISHZHbFczcGp1eDFFLzNVSDJPdTBVaGN4L3djNnBqdjNXa28vRlR4KzlnVDFwSHl5bVdhS3RzMWhjdnJnYmRTdjhTd0l5N3UwQTNKNkVrbll5M1prOFJTeEhrZko3SkRPbTRoMnhPOEU4UzFJUVhRYStMY3RKNjhlcUVFUURlVm9OcGZEdjJ1aGRTMGxBR0VXZCtuNkJBM2hhRVpkWmJnamhJQS9WcFZDVnBsR1RUVFprRWpSdWkrdno0TjZJY2FQanA0NWlLUlFRRzRlTFh6aXpreG5ueDZvUVFnOHlFeHpOdEI2YXdkWGJrNnBDVm9Nd1ZzUjZsZEQ4aEYwcDA1V0piUjFpcnp2b1dPRFFVQXZhTGtzTHB2aExTakFLWk5rTjZHQXNBeUdsVXJ5S01YU2dUMEZtMmpqSDh1SlpCVEFhUWNCVEJuTndaNDhySUVKWkI4VzZZcjIrTGw5VVNlczhWL0lqMk5FZGRxVHdMelhIWEt1ZFRTRjFaOXg4MnY4Y202bnViaGw2WGRRT251amRIY0hOb293cEs3ZEUwVGZ5cXlLUUJYWjZGK1hLZmd6dk1OQmNEckhPd01LSEYrTkh4eXpvaVNyN2NzUUY1RDFqTTAzL0UrdGo4SU9Pa3ZYZmQ3QW9rdEhrOWFPMEVVRzRvQTFtb3FhWmwyRUZyT0tEd0NHS1VyM1lNZHRLME1kanF4MUJSY2tUdUhrSFowM0ZJa0NOdEJFd3AveTZDcHE0QnlzYnlXWEZQcUVIaGFIZkpkaDV4R3lpa3o4YmVuRUdBUHdhUVE0SytlZENRZGMwTUpnTzJVT3VTRkc2NzRRME4yc1ZyeTA2YVF6eWNHQ3oyc2NzdXRlUGNvNU9zWXRzNDBoNWZPRVRRQ21NZ1QxL0U5OGxLc2pvL0t0amg1bmNpanBDUHVrS0grSUZPUzRjWVIwc3pKK1U3QytrWWJPUTZmNVdoWXdVSUN2MldaeGZLQ2JBKy9vVWhndi9FZWFlSDRHcG9CaEowMUdkTWgvZFVHRzF4UUhVK1VyVU5ha3BRTnN1czZyaWtUOFBjZExjV0M4QSt3RjhaL1NxQ3kzaUdEZUtIcFhkNmpoQm5uRlcyMnUyWmMycHN6NVdzcElYZzZRTmNoREc0UGJQVTBORE1JSDkxa3ZSTGprdXI0R05pMkdqUGFPY2lyb1lUZy9DaWdwWXlnWk44QmE4bHg0OWpqL09WeFBmU3I2Znh4SDl6N2p5Zy90SDh6S3RzRC9xN1ZlL2Y3Ty9mQkRTVUVUeDFLRjFxSEVXbGY0MGtSSHVxK29ZeTR0c1QxZU8vcXRmZlVkME1MeEgyM3phZ2NwNnpCUTcxbU0yZ204amF1NDJPWmZWeExIUi9qNUpYTDFpcmtOV3U5enlGRG83UW4rdzQ0dy9UL2g5SGV3UXlHN21RQUFBQUFTVVZPUks1Q1lJST0iLz4KPC9kZWZzPgo8L3N2Zz4K" alt="Ticketbox" class="style__Logo-sc-at0dtu-2 eUzvQp">
                                </a>
                                <div style="align-items:center;gap:1.5rem" class="Container__Flex-sc-17x1kk6-2 eQuqEb">
                                    <div class="style__Wrapper-sc-czt9o-0 eOdBXI">
                                        <span>
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" id="search-icon">
                                            <path d="M11 17a6 6 0 100-12 6 6 0 000 12zM18.5 18.5l-3-3" stroke="#2A2D34" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </span>
                                        <input type="text" name="search-input" id="search-input" readonly="" placeholder="Bạn tìm gì hôm nay?" value="">
                                        <button>Tìm kiếm</button>
                                    </div>
                                    <a href="https://ticketbox.vn/organizer/create-event" target="_blank" rel="noopener noreferrer" class="style__Wrapper-sc-jf173m-0 dmblPO">Tạo sự kiện</a>
                                    <div class="style__Wrapper-sc-mkqi1a-0 jVrJkv">
                                        <a href="/my-tickets">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M19.758 12a2.91 2.91 0 011.928-2.74c.52-.186.98-.617.98-1.17V5.243a1 1 0 00-1-1H2.334a1 1 0 00-1 1v2.849c0 .552.461.983.981 1.17a2.91 2.91 0 010 5.478c-.52.187-.98.618-.98 1.17v2.848a1 1 0 001 1h19.333a1 1 0 001-1V15.91c0-.552-.461-.983-.981-1.17A2.91 2.91 0 0119.758 12z" stroke="#828BA0" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                            <path d="M8.121 10.06h7.758M8.121 13.94h7.758" stroke="#828BA0" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                            <div>Vé đã mua</div>
                                        </a>


                                    </div>
                                    <div style="display:flex;align-items:center;gap:1rem"> 
                                        <div class="Container__AlignItemsCenter-sc-17x1kk6-4 style__UserWrapper-sc-1r13r5n-3 fYSkyu ctOWEK">
                                            <div class="Container__AlignItemsCenter-sc-17x1kk6-4 style__UserContent-sc-1r13r5n-0 fYSkyu bMeMKg">
                                                <img src="https://static.ticketbox.vn/avatar.png" alt="Avatar" class="style__Avatar-sc-1r13r5n-1 jDWmyp">
                                                Tài khoản<img id="dropdown-icon" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIKCSB3aWR0aD0iMjkyLjM2MnB4IiBoZWlnaHQ9IjI5Mi4zNjJweCIgdmlld0JveD0iMCAwIDI5Mi4zNjIgMjkyLjM2MiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMjkyLjM2MiAyOTIuMzYyOyIKCSB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8cGF0aCBkPSJNMjg2LjkzNSw2OS4zNzdjLTMuNjE0LTMuNjE3LTcuODk4LTUuNDI0LTEyLjg0OC01LjQyNEgxOC4yNzRjLTQuOTUyLDAtOS4yMzMsMS44MDctMTIuODUsNS40MjQKCQlDMS44MDcsNzIuOTk4LDAsNzcuMjc5LDAsODIuMjI4YzAsNC45NDgsMS44MDcsOS4yMjksNS40MjQsMTIuODQ3bDEyNy45MDcsMTI3LjkwN2MzLjYyMSwzLjYxNyw3LjkwMiw1LjQyOCwxMi44NSw1LjQyOAoJCXM5LjIzMy0xLjgxMSwxMi44NDctNS40MjhMMjg2LjkzNSw5NS4wNzRjMy42MTMtMy42MTcsNS40MjctNy44OTgsNS40MjctMTIuODQ3QzI5Mi4zNjIsNzcuMjc5LDI5MC41NDgsNzIuOTk4LDI4Ni45MzUsNjkuMzc3eiIgZmlsbD0iI2ZmZiIvPgo8L2c+Cjwvc3ZnPgo=" alt="caret" style="width: 8px;"></div>
                                            <div class="style__PopupWrapper-sc-1r13r5n-2 kcCDCt">
                                                <a href="">
                                                    <div class="style__PopupItem-sc-1r13r5n-4 fyYHkT">
                                                        <svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M0 2a2 2 0 012-2h16a2 2 0 012 2v3.172a1 1 0 01-.293.707L19 6.586a2 2 0 000 2.828l.707.707a1 1 0 01.293.707V14a2 2 0 01-2 2H2a2 2 0 01-2-2v-3.172a1 1 0 01.293-.707L1 9.414a2 2 0 000-2.828l-.707-.707A1 1 0 010 5.172V2zm18 0H2v2.757l.414.415a4 4 0 010 5.656L2 11.243V14h16v-2.757l-.414-.415a4 4 0 010-5.656L18 4.757V2zM6 6.25a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm0 3.5a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1z" fill="#38383D"></path></svg>Vé đã mua</div></a><a href=""><div class="style__PopupItem-sc-1r13r5n-4 fyYHkT"><svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M10.514 8.32a.573.573 0 00-1.028 0l-.792 1.604a.573.573 0 01-.432.314l-1.77.257a.573.573 0 00-.318.978l1.281 1.25a.573.573 0 01.165.506l-.302 1.764a.573.573 0 00.831.604l1.584-.832a.573.573 0 01.534 0l1.584.832a.573.573 0 00.831-.604l-.302-1.764a.573.573 0 01.165-.507l1.281-1.249a.573.573 0 00-.318-.978l-1.77-.257a.573.573 0 01-.432-.314l-.792-1.604z" fill="#38383D"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M7 1a1 1 0 00-2 0v1H4a4 4 0 00-4 4v12a2 2 0 002 2h16a2 2 0 002-2V6a4 4 0 00-4-4h-1V1a1 1 0 10-2 0v1H7V1zm6 4V4H7v1a1 1 0 11-2 0V4H4a2 2 0 00-2 2v12h16V6a2 2 0 00-2-2h-1v1a1 1 0 11-2 0z" fill="#38383D"></path>
                                                        </svg>Sự kiện của tôi</div>
                                                </a>
                                                <a href="">
                                                    <div class="style__PopupItem-sc-1r13r5n-4 fyYHkT">
                                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10 0C4.477 0 0 4.477 0 10s4.477 10 10 10 10-4.477 10-10S15.523 0 10 0zM2 10a8 8 0 1113.81 5.499 6.013 6.013 0 00-2.905-3.75 4 4 0 10-5.811 0A6.013 6.013 0 004.19 15.5 7.973 7.973 0 012 10zm4 6.93A7.963 7.963 0 0010 18c1.457 0 2.823-.39 4-1.07a4 4 0 00-8 0zM10 7a2 2 0 100 4 2 2 0 000-4z" fill="#38383D"></path>
                                                        </svg>
                                                        Trang cá nhân
                                                    </div>
                                                </a>
                                                <a href="#">
                                                    <div class="style__PopupItem-sc-1r13r5n-4 fyYHkT">
                                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M4 10a1 1 0 001 1h11.586l-4.293 4.293a1 1 0 001.414 1.414l5.999-5.999.012-.012A.995.995 0 0020 10a.997.997 0 00-.294-.708l-5.999-6a1 1 0 10-1.414 1.415L16.586 9H5a1 1 0 00-1 1z" fill="#38383D"></path>
                                                        <path d="M5 19a1 1 0 00-1-1H2V2h2a1 1 0 100-2H1a1 1 0 00-1 1v18a1 1 0 001 1h3a1 1 0 001-1z" fill="#38383D"></path>
                                                        </svg>
                                                        Đăng xuất
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="Container__AlignItemsCenter-sc-17x1kk6-4 style__LanguageWrapper-sc-1qkcram-3 ghYYae fiLbFZ">
                                            <div class="Container__AlignItemsCenter-sc-17x1kk6-4 style__MainFlag-sc-1qkcram-1 ghYYae fqJZWI">
                                                <div class="flag-icon-container">
                                                    <img class="flag-icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTI0IDIwQzI0IDIwLjU1MjUgMjMuNTUyNSAyMSAyMyAyMUgxQzAuNDQ3NSAyMSAwIDIwLjU1MjUgMCAyMFY0QzAgMy40NDc1IDAuNDQ3NSAzIDEgM0gyM0MyMy41NTI1IDMgMjQgMy40NDc1IDI0IDRWMjBaIiBmaWxsPSIjRDgyODI3Ii8+CjxwYXRoIGQ9Ik0xNi4xODAzIDEwLjUyMDdIMTMuMjM0OEwxMS45OTk4IDcuODQyMTZMMTAuNzYzMyAxMC41MjA3SDcuODE4ODVMOS45NzAzNSAxMi43NDcyTDkuMTc1MzUgMTUuOTczN0wxMS45OTk4IDE0LjM2OTJMMTQuODIzOCAxNS45NzM3TDE0LjAyODggMTIuNzQ3MkwxNi4xODAzIDEwLjUyMDdaIiBmaWxsPSIjRkZGRDM4Ii8+Cjwvc3ZnPgo=" alt="Tiếng Việt">
                                                </div>
                                                <img id="dropdown-icon" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTYuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+CjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHhtbG5zOnhsaW5rPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hsaW5rIiB4PSIwcHgiIHk9IjBweCIKCSB3aWR0aD0iMjkyLjM2MnB4IiBoZWlnaHQ9IjI5Mi4zNjJweCIgdmlld0JveD0iMCAwIDI5Mi4zNjIgMjkyLjM2MiIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgMjkyLjM2MiAyOTIuMzYyOyIKCSB4bWw6c3BhY2U9InByZXNlcnZlIj4KPGc+Cgk8cGF0aCBkPSJNMjg2LjkzNSw2OS4zNzdjLTMuNjE0LTMuNjE3LTcuODk4LTUuNDI0LTEyLjg0OC01LjQyNEgxOC4yNzRjLTQuOTUyLDAtOS4yMzMsMS44MDctMTIuODUsNS40MjQKCQlDMS44MDcsNzIuOTk4LDAsNzcuMjc5LDAsODIuMjI4YzAsNC45NDgsMS44MDcsOS4yMjksNS40MjQsMTIuODQ3bDEyNy45MDcsMTI3LjkwN2MzLjYyMSwzLjYxNyw3LjkwMiw1LjQyOCwxMi44NSw1LjQyOAoJCXM5LjIzMy0xLjgxMSwxMi44NDctNS40MjhMMjg2LjkzNSw5NS4wNzRjMy42MTMtMy42MTcsNS40MjctNy44OTgsNS40MjctMTIuODQ3QzI5Mi4zNjIsNzcuMjc5LDI5MC41NDgsNzIuOTk4LDI4Ni45MzUsNjkuMzc3eiIgZmlsbD0iI2ZmZiIvPgo8L2c+Cjwvc3ZnPgo=" alt="caret" style="width:8px">
                                            </div>
                                            <div class="style__PopupLanguageWrapper-sc-1qkcram-0 jRgsFx">
                                                <div class="Container__AlignItemsCenter-sc-17x1kk6-4 style__Flag-sc-1qkcram-2 ghYYae gCksbI">
                                                    <div class="flag-icon-container">
                                                        <img class="flag-icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTI0IDIwQzI0IDIwLjU1MjUgMjMuNTUyNSAyMSAyMyAyMUgxQzAuNDQ3NSAyMSAwIDIwLjU1MjUgMCAyMFY0QzAgMy40NDc1IDAuNDQ3NSAzIDEgM0gyM0MyMy41NTI1IDMgMjQgMy40NDc1IDI0IDRWMjBaIiBmaWxsPSIjRDgyODI3Ii8+CjxwYXRoIGQ9Ik0xNi4xODAzIDEwLjUyMDdIMTMuMjM0OEwxMS45OTk4IDcuODQyMTZMMTAuNzYzMyAxMC41MjA3SDcuODE4ODVMOS45NzAzNSAxMi43NDcyTDkuMTc1MzUgMTUuOTczN0wxMS45OTk4IDE0LjM2OTJMMTQuODIzOCAxNS45NzM3TDE0LjAyODggMTIuNzQ3MkwxNi4xODAzIDEwLjUyMDdaIiBmaWxsPSIjRkZGRDM4Ii8+Cjwvc3ZnPgo=" alt="Tiếng Việt">
                                                    </div>
                                                    <span style="font-weight:bold">Tiếng Việt</span>
                                                </div>
                                                <div class="Container__AlignItemsCenter-sc-17x1kk6-4 style__Flag-sc-1qkcram-2 ghYYae gCksbI">
                                                    <div class="flag-icon-container">
                                                    </div>
                                                    <span style="font-weight:normal">English</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </header>
                            <header class="style__Wrapper-sc-nbwzd5-0 jHXUVU">
                                <div class="content-col" id="back-content">
                                    <div id="back-icon">
                                        <svg width="8" height="14" viewBox="0 0 8 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M7.707 13.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L2.414 7l5.293 5.293a1 1 0 010 1.414z" fill="#fff"></path>
                                        </svg>
                                    </div>
                                    <span id="back-text">Trang chủ</span>
                                </div>
                                <div id="booking-step">

                                </div>
                                <div class="content-col" id="other-content">
                                    <div class="style__Wrapper-sc-15q9g98-0 iaNafX">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" id="search-icon">
                                        <path d="M11 17a6 6 0 100-12 6 6 0 000 12zM18.5 18.5l-3-3" stroke="#2A2D34" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round">

                                        </path>
                                        </svg>
                                    </div>
                                    <div class="style__Wrapper-sc-1n4ycsg-0 dGUZFx">
                                        <div class="style__AuthedWrapper-sc-1n4ycsg-1 dvEGjP">
                                            <img src="https://static.ticketbox.vn/avatar.png" alt="Avatar" class="style__Avatar-sc-1n4ycsg-2 fGTcyH">
                                            <div class="style__PopupWrapper-sc-1n4ycsg-3 jNDbtZ">
                                                <a href="">
                                                    <div class="style__PopupItem-sc-1n4ycsg-4 dhPIgD">
                                                        <svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M0 2a2 2 0 012-2h16a2 2 0 012 2v3.172a1 1 0 01-.293.707L19 6.586a2 2 0 000 2.828l.707.707a1 1 0 01.293.707V14a2 2 0 01-2 2H2a2 2 0 01-2-2v-3.172a1 1 0 01.293-.707L1 9.414a2 2 0 000-2.828l-.707-.707A1 1 0 010 5.172V2zm18 0H2v2.757l.414.415a4 4 0 010 5.656L2 11.243V14h16v-2.757l-.414-.415a4 4 0 010-5.656L18 4.757V2zM6 6.25a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm0 3.5a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1z" fill="#38383D">

                                                        </path>
                                                        </svg>
                                                        Vé đã mua</div>
                                                </a>
                                                <a href="">
                                                    <div class="style__PopupItem-sc-1n4ycsg-4 dhPIgD">
                                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M10.514 8.32a.573.573 0 00-1.028 0l-.792 1.604a.573.573 0 01-.432.314l-1.77.257a.573.573 0 00-.318.978l1.281 1.25a.573.573 0 01.165.506l-.302 1.764a.573.573 0 00.831.604l1.584-.832a.573.573 0 01.534 0l1.584.832a.573.573 0 00.831-.604l-.302-1.764a.573.573 0 01.165-.507l1.281-1.249a.573.573 0 00-.318-.978l-1.77-.257a.573.573 0 01-.432-.314l-.792-1.604z" fill="#38383D"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M7 1a1 1 0 00-2 0v1H4a4 4 0 00-4 4v12a2 2 0 002 2h16a2 2 0 002-2V6a4 4 0 00-4-4h-1V1a1 1 0 10-2 0v1H7V1zm6 4V4H7v1a1 1 0 11-2 0V4H4a2 2 0 00-2 2v12h16V6a2 2 0 00-2-2h-1v1a1 1 0 11-2 0z" fill="#38383D"></path></svg>Sự kiện của tôi</div></a><a href=""><div class="style__PopupItem-sc-1n4ycsg-4 dhPIgD">
                                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10 0C4.477 0 0 4.477 0 10s4.477 10 10 10 10-4.477 10-10S15.523 0 10 0zM2 10a8 8 0 1113.81 5.499 6.013 6.013 0 00-2.905-3.75 4 4 0 10-5.811 0A6.013 6.013 0 004.19 15.5 7.973 7.973 0 012 10zm4 6.93A7.963 7.963 0 0010 18c1.457 0 2.823-.39 4-1.07a4 4 0 00-8 0zM10 7a2 2 0 100 4 2 2 0 000-4z" fill="#38383D"></path>
                                                        </svg>
                                                        Trang cá nhân
                                                    </div>
                                                </a>
                                                <a href="#">
                                                    <div class="style__PopupItem-sc-1n4ycsg-4 dhPIgD">
                                                        <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M4 10a1 1 0 001 1h11.586l-4.293 4.293a1 1 0 001.414 1.414l5.999-5.999.012-.012A.995.995 0 0020 10a.997.997 0 00-.294-.708l-5.999-6a1 1 0 10-1.414 1.415L16.586 9H5a1 1 0 00-1 1z" fill="#38383D"></path>
                                                        <path d="M5 19a1 1 0 00-1-1H2V2h2a1 1 0 100-2H1a1 1 0 00-1 1v18a1 1 0 001 1h3a1 1 0 001-1z" fill="#38383D"></path>
                                                        </svg>
                                                        Đăng xuất
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="style__PositionWrapper-sc-12ehcmm-0 fPEUGc">
                                        <div class="style__Wrapper-sc-12ehcmm-1 gdlYdz">
                                            <div id="flag-container" lang="vi" class="style__FlagContainer-sc-12ehcmm-2 bPTKzc">
                                                <img class="flag-icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTI0IDIwQzI0IDIwLjU1MjUgMjMuNTUyNSAyMSAyMyAyMUgxQzAuNDQ3NSAyMSAwIDIwLjU1MjUgMCAyMFY0QzAgMy40NDc1IDAuNDQ3NSAzIDEgM0gyM0MyMy41NTI1IDMgMjQgMy40NDc1IDI0IDRWMjBaIiBmaWxsPSIjRDgyODI3Ii8+CjxwYXRoIGQ9Ik0xNi4xODAzIDEwLjUyMDdIMTMuMjM0OEwxMS45OTk4IDcuODQyMTZMMTAuNzYzMyAxMC41MjA3SDcuODE4ODVMOS45NzAzNSAxMi43NDcyTDkuMTc1MzUgMTUuOTczN0wxMS45OTk4IDE0LjM2OTJMMTQuODIzOCAxNS45NzM3TDE0LjAyODggMTIuNzQ3MkwxNi4xODAzIDEwLjUyMDdaIiBmaWxsPSIjRkZGRDM4Ii8+Cjwvc3ZnPgo=" alt="Tiếng Việt">
                                            </div>
                                            <div class="style__PopupLanguageWrapper-sc-12ehcmm-3 bZOaFY">
                                                <div class="Container__AlignItemsCenter-sc-17x1kk6-4 style__Flag-sc-12ehcmm-4 ghYYae hPiGh">

                                                    <div class="flag-icon-container">
                                                        <img class="flag-icon" src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHBhdGggZD0iTTI0IDIwQzI0IDIwLjU1MjUgMjMuNTUyNSAyMSAyMyAyMUgxQzAuNDQ3NSAyMSAwIDIwLjU1MjUgMCAyMFY0QzAgMy40NDc1IDAuNDQ3NSAzIDEgM0gyM0MyMy41NTI1IDMgMjQgMy40NDc1IDI0IDRWMjBaIiBmaWxsPSIjRDgyODI3Ii8+CjxwYXRoIGQ9Ik0xNi4xODAzIDEwLjUyMDdIMTMuMjM0OEwxMS45OTk4IDcuODQyMTZMMTAuNzYzMyAxMC41MjA3SDcuODE4ODVMOS45NzAzNSAxMi43NDcyTDkuMTc1MzUgMTUuOTczN0wxMS45OTk4IDE0LjM2OTJMMTQuODIzOCAxNS45NzM3TDE0LjAyODggMTIuNzQ3MkwxNi4xODAzIDEwLjUyMDdaIiBmaWxsPSIjRkZGRDM4Ii8+Cjwvc3ZnPgo=" alt="Tiếng Việt">

                                                    </div>
                                                    <span style="font-weight:bold">Tiếng Việt</span>

                                                </div>
                                                <div class="Container__AlignItemsCenter-sc-17x1kk6-4 style__Flag-sc-12ehcmm-4 ghYYae hPiGh">
                                                    <div class="flag-icon-container">
                                                        <img class="flag-icon" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9Im5vIj8+CjwhLS0gQ3JlYXRlZCB3aXRoIFNvZGlwb2RpICgiaHR0cDovL3d3dy5zb2RpcG9kaS5jb20vIikgLS0+CjwhLS0gL0NyZWF0aXZlIENvbW1vbnMgUHVibGljIERvbWFpbiAtLT4KPCEtLQoKPHJkZjpSREYgeG1sbnM9Imh0dHA6Ly93ZWIucmVzb3VyY2Uub3JnL2NjLyIKICAgICB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iCiAgICAgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KPFdvcmsgcmRmOmFib3V0PSIiPgogICAgPGRjOnRpdGxlPk5ldyBaZWFsYW5kLCBBdXN0cmFsaWEsIFVuaXRlZCBLaW5nZG9tLCBVbml0ZWQgU3RhdGVzLApCb3NuaWEgYW5kIEhlcnplZ292aW5hLCBBemVyYmFpamFuLCBBcm1lbmlhLCBCYWhhbWFzLCBCZWxnaXVtLCBCZW5pbiwKQnVsZ2FyaWEsIEVzdG9uaWEsIEZpbmxhbmQsIEdhYm9uLCBHYW1iaWEsIEdlcm1hbnksIEdyZWVjZSwgR3JlZW5sYW5kLApHdWluZWEsIEhvbmR1cmFzLCBJc3JhZWwsIEphbWFpY2EsIEpvcmRhbiwgYW5kIFJvbWFuaWEgRmxhZ3M8L2RjOnRpdGxlPgogICAgPGRjOnJpZ2h0cz48QWdlbnQ+CiAgICAgICA8ZGM6dGl0bGU+RGFuaWVsIE1jUmFlPC9kYzp0aXRsZT4KICAgIDwvQWdlbnQ+PC9kYzpyaWdodHM+CiAgICA8bGljZW5zZSByZGY6cmVzb3VyY2U9Imh0dHA6Ly93ZWIucmVzb3VyY2Uub3JnL2NjL1B1YmxpY0RvbWFpbiIgLz4KPC9Xb3JrPgoKPExpY2Vuc2UgcmRmOmFib3V0PSJodHRwOi8vd2ViLnJlc291cmNlLm9yZy9jYy9QdWJsaWNEb21haW4iPgogICAgPHBlcm1pdHMgcmRmOnJlc291cmNlPSJodHRwOi8vd2ViLnJlc291cmNlLm9yZy9jYy9SZXByb2R1Y3Rpb24iIC8+CiAgICA8cGVybWl0cyByZGY6cmVzb3VyY2U9Imh0dHA6Ly93ZWIucmVzb3VyY2Uub3JnL2NjL0Rpc3RyaWJ1dGlvbiIgLz4KICAgIDxwZXJtaXRzIHJkZjpyZXNvdXJjZT0iaHR0cDovL3dlYi5yZXNvdXJjZS5vcmcvY2MvRGVyaXZhdGl2ZVdvcmtzIiAvPgo8L0xpY2Vuc2U+CjwvcmRmOlJERj4KLS0+CjxzdmcgaWQ9InN2ZzEiIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9IjQ4MCIgd2lkdGg9IjY0MCIgdmVyc2lvbj0iMS4xIiB4bWxuczpjYz0iaHR0cDovL2NyZWF0aXZlY29tbW9ucy5vcmcvbnMjIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iPgogPG1ldGFkYXRhIGlkPSJtZXRhZGF0YTI5OTUiPgogIDxyZGY6UkRGPgogICA8Y2M6V29yayByZGY6YWJvdXQ9IiI+CiAgICA8ZGM6Zm9ybWF0PmltYWdlL3N2Zyt4bWw8L2RjOmZvcm1hdD4KICAgIDxkYzp0eXBlIHJkZjpyZXNvdXJjZT0iaHR0cDovL3B1cmwub3JnL2RjL2RjbWl0eXBlL1N0aWxsSW1hZ2UiLz4KICAgPC9jYzpXb3JrPgogIDwvcmRmOlJERj4KIDwvbWV0YWRhdGE+CiA8ZGVmcyBpZD0iZGVmczMiPgogIDxjbGlwUGF0aCBpZD0iY2xpcFBhdGg4NjczIiBjbGlwUGF0aFVuaXRzPSJ1c2VyU3BhY2VPblVzZSI+CiAgIDxyZWN0IGlkPSJyZWN0ODY3NSIgZmlsbC1vcGFjaXR5PSIwLjY3IiBoZWlnaHQ9IjUxMiIgd2lkdGg9IjY4Mi42NyIgeT0iLS4wMDAwMDI4NjEzIiB4PSItODUuMzMzIi8+CiAgPC9jbGlwUGF0aD4KIDwvZGVmcz4KIDxnIGlkPSJmbGFnIiBjbGlwLXBhdGg9InVybCgjY2xpcFBhdGg4NjczKSIgdHJhbnNmb3JtPSJtYXRyaXgoLjkzNzUwIDAgMCAuOTM3NTAgODAgLjAwMDAwMjY4MjUpIj4KICA8ZyBpZD0iZzU3OCIgc3Ryb2tlLXdpZHRoPSIxcHQiIHRyYW5zZm9ybT0ibWF0cml4KDE3LjA2NyAwIDAgMTcuMDY3IC0yNTYgLTAuMDAwMDAyNCkiPgogICA8cmVjdCBpZD0icmVjdDEyNCIgaGVpZ2h0PSIzMCIgd2lkdGg9IjYwIiB5PSIwIiB4PSIwIiBmaWxsPSIjMDA2Ii8+CiAgIDxnIGlkPSJnNTg0Ij4KICAgIDxwYXRoIGlkPSJwYXRoMTQ2IiBkPSJtMCAwdjMuMzU0MWw1My4yOTIgMjYuNjQ2aDYuNzA4di0zLjM1NGwtNTMuMjkyLTI2LjY0NmgtNi43MDh6bTYwIDB2My4zNTRsLTUzLjI5MiAyNi42NDZoLTYuNzA4di0zLjM1NGw1My4yOTItMjYuNjQ2aDYuNzA4eiIgZmlsbD0iI2ZmZiIvPgogICAgPHBhdGggaWQ9InBhdGgxMzYiIGQ9Im0yNSAwdjMwaDEwdi0zMGgtMTB6bS0yNSAxMHYxMGg2MHYtMTBoLTYweiIgZmlsbD0iI2ZmZiIvPgogICAgPHBhdGggaWQ9InBhdGgxNDEiIGQ9Im0wIDEydjZoNjB2LTZoLTYwem0yNy0xMnYzMGg2di0zMGgtNnoiIGZpbGw9IiNjMDAiLz4KICAgIDxwYXRoIGlkPSJwYXRoMTUwIiBkPSJtMCAzMCAyMC0xMGg0LjQ3MmwtMjAgMTBoLTQuNDcyem0wLTMwIDIwIDEwaC00LjQ3MmwtMTUuNTI4LTcuNzYzOXYtMi4yMzYxem0zNS41MjggMTAgMjAtMTBoNC40NzJsLTIwIDEwaC00LjQ3MnptMjQuNDcyIDIwLTIwLTEwaDQuNDcybDE1LjUyOCA3Ljc2NHYyLjIzNnoiIGZpbGw9IiNjMDAiLz4KICAgPC9nPgogIDwvZz4KIDwvZz4KPC9zdmc+Cg==" alt="English"></div><span style="font-weight:normal">English</span></div></div></div></div></div></header></div></div><main class="Layout__Main-sc-1x9m3gv-1 imfxcL">
                        <div class="style__EventDetailWrapper-sc-1mnflab-0 jKvuHi">
                            <div class="style__CategoriesBarWrapper-sc-1w5ywrz-0 bRCsbQ">
                                <div class="tbox-container">
                                    <div class="content" id="categories-content">
                                        <div class="style__Category-sc-1w5ywrz-1 dZdRWp">
                                            <span>Nhạc sống</span>
                                        </div>
                                        <div class="style__Category-sc-1w5ywrz-1 dZdRWp">
                                            <span>Sân khấu &amp; Nghệ thuật</span>
                                        </div>
                                        <div class="style__Category-sc-1w5ywrz-1 dZdRWp"><span>Thể Thao</span></div>
                                        <div class="style__Category-sc-1w5ywrz-1 dZdRWp"><span>Khác</span></div>
                                    </div>
                                </div>
                            </div>
                            
                            
                              <div id="banner" class="style__BannerWrapper-sc-56ar6x-0 iVXoTn">
                <div class="tbox-container content desktop">
                    <div class="text-wrapper">
                        <div id="circle1" class="circle"></div>
                        <div id="circle2" class="circle"></div>
                        <svg width="4" height="415" viewBox="0 0 4 415" fill="none" xmlns="http://www.w3.org/2000/svg" id="vertical-dashed"><path stroke="#27272A" stroke-width="4" stroke-linecap="round" stroke-dasharray="4 10" d="M2 2v411"></path></svg>
                        <svg width="4" height="415" viewBox="0 0 4 415" fill="none" xmlns="http://www.w3.org/2000/svg" id="vertical-dashed-2"><path stroke="#27272A" stroke-width="4" stroke-linecap="round" stroke-dasharray="4 10" d="M2 2v411"></path></svg>
                        <div class="text">
                            <div class="info">
                                <p id="title">
                                    <strong>${event.name}</strong>
                                </p>
                                <p id="date">
                                    <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg" class="icon">
                                    <path d="M4.333.333C4.702.333 5 .632 5 1v.667h4V1a.667.667 0 011.333 0v.667H11a2.667 2.667 0 012.667 2.667v1.333H.333V4.334A2.667 2.667 0 013 1.667h.667V1c0-.368.298-.667.666-.667zM13.667 7H.333v5.334c0 .736.597 1.333 1.334 1.333h10.666c.737 0 1.334-.597 1.334-1.333V7z" fill="#fff"></path>
                                    </svg>
                                    <span id="date-text">${event.startTime} ${event.startDate}</span></p>
                                <p id="venue"><svg width="22" height="28" viewBox="0 0 22 28" fill="none" xmlns="http://www.w3.org/2000/svg" id="location-icon" class="icon">
                                    <path fill-rule="evenodd" clip-rule="evenodd" d="M4.031 3.307a10.514 10.514 0 0113.937 0c4.485 3.945 4.955 10.854 1.058 15.392l-7.015 8.17a1.333 1.333 0 01-2.023 0l-7.015-8.17C-.923 14.161-.454 7.252 4.031 3.307zM11 14.667A3.333 3.333 0 1011 8a3.333 3.333 0 000 6.666z" fill="#000"></path>

                                    </svg>
                                    <span class="venue-text">${event.destination}</span></p>
                            </div>
                            <div class="price">
                                <div id="ticket-price">
                                    <span>Giá từ</span>
                                    <a href="#ticket-info" id="price-value">
                                        <span>1.000.000 đ</span>
                                        <svg width="8" height="14" viewBox="0 0 8 14" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M.293.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L5.586 7 .293 1.707a1 1 0 010-1.414z" fill="#2DC275"></path></svg>
                                    </a>
                                </div>
                                <a href="${pageContext.request.contextPath}/areaDetailController?eventId=${event.id}">
                                    <button id="buynow-btn" class="style__BuynowBtn-sc-56ar6x-1 bHHstD" fdprocessedid="5iuped">Mua vé ngay</button>
                                </a>

                            </div>
                        </div>
                    </div>
                    <div class="img-wrapper">
                        <img src="${event.img_event}" alt="Banner cover">
                    </div>
                </div>
            </div>
                    
                      
                    

            <div class="style__Wrapper-sc-12c1ml7-0 eYXroU"><h4 id="title" class="style__Title-sc-12c1ml7-1 kYOHji">Giới thiệu</h4>
                <div id="content" class="style__Content-sc-12c1ml7-2 digqDr">
                    <div class="style__WrapperIntro-sc-e7oelh-0 giRCXh" style="height: auto;">
                        <div class="style__ContentIntro-sc-e7oelh-1 czloHV">
                            <p class="ql-align-justify"><strong>Hạng vé/giá bán:</strong>
                            </p>
                            <ul>
                                <li class="ql-align-justify">Trót Yêu:&nbsp;&nbsp;4.000.000 VND</li>
                                <li class="ql-align-justify">Dấu Mưa:&nbsp;3.300.000 VND</li>
                                <li class="ql-align-justify">Tự Tình:&nbsp;&nbsp;2.700.000 VND</li>
                                <li class="ql-align-justify">Chuyện mưa:&nbsp;2.200.000 VND</li>
                                <li class="ql-align-justify">Chưa bao giờ:&nbsp;1.800.000 VND</li>
                                <li class="ql-align-justify">Gọi mưa:&nbsp;1.000.000 VND</li>
                            </ul>
                            <p class="ql-align-center"><img src="${event.img_position}"></p>
                            <p class="ql-align-justify">&nbsp;</p>
                            <ul>
                                <li class="ql-align-justify">Trong quá trình mua vé, đối với hạng vé ngồi, khách hàng không được chọn vị trí ngồi chính xác. BTC sẽ xuất vé có số ghế ngồi cụ thể cho khách hàng và khách hàng bắt buộc phải ngồi theo đúng số ghế trên vé.</li>
                                <li class="ql-align-justify">Mỗi Vé tương ứng với 01 khách tham gia (không bao gồm trẻ em).</li>
                                <li class="ql-align-justify">Người Mua kiểm tra lại thông tin Vé (tổng số vé, loại vé, số vé từng loại) và số tiền trước khi xác nhận Đơn hàng mua Vé.</li>
                                <li class="ql-align-justify">Vé Sự Kiện là Vé không được đổi hoặc trả lại dưới mọi hình thức, khách hàng vui lòng cân nhắc kỹ trước khi mua.</li>
                                <li class="ql-align-justify">Thời gian giữ Vé: 15 PHÚT/ lượt.</li>
                                <li class="ql-align-justify">Khách hàng được mua tối đa 10 Vé/ 1 loại vé/ 1 giao dịch.</li>
                                <li class="ql-align-justify">Khách hàng có trách nhiệm bảo mật tuyệt đối mã Vé điện tử của mình. Trường hợp có nhiều hơn 1 người check-in bằng 1 mã Vé điện tử thì BTC sẽ chấp nhận người đầu tiên check-in mã Vé đó được tham gia chương trình.</li>
                                <li class="ql-align-justify">Đối với Người Mua đặt qua Ticketbox, sau khi hoàn thành thanh toán tiền mua Vé (Giao dịch thành công), hệ thống sẽ thực hiện gửi Mã Đặt Chỗ thành công cho Người Mua qua email. Chậm nhất trong vòng 5 (năm) ngày làm việc trước ngày sự kiện diễn ra (Hồ Chí Minh - 13/07/2023) BTC sẽ thực hiện gửi (các) Mã Vé QR (dùng để checkin vào cổng) cho Người Mua qua email Người Mua đã cung cấp.&nbsp;</li>
                                <li class="ql-align-justify">Để đảm bảo nhận được Mã Đặt Chỗ và Mã Vé QR, trước khi thực hiện việc đặt mua Vé theo quy trình giao dịch tại Quy chế này, Người Mua nên chủ động kiểm tra và điền đầy đủ, chính xác thông tin email trên các nền tảng bán Vé.</li>
                                <li class="ql-align-justify">Nếu trong vòng 24 giờ kể từ khi mua Vé mà Người Mua vẫn chưa nhận được Mã Đặt Chỗ (đối với Vé đặt qua Ticketbox) thì Người Mua vui lòng liên hệ Hotline: 1900.6408 hoặc email support@ticketbox.vn và Fanpage Facebook https://www.facebook.com/ticketbox.vn</li>
                            </ul>
                            <p class="ql-align-justify">&nbsp;</p>
                            <p class="ql-align-justify"> ${event.description}</p>
                          
                            
                        </div>
                        <div rotate="false" class="style__IconHandleHeight-sc-e7oelh-3 eVsDpA">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M6 9l6 6 6-6" stroke="#2A2D34" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round">

                            </path>
                            </svg>
                        </div>
                    </div>
                </div>
            </div>


            <!-- *** Subscribe *** -->
            <div class="subscribe">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <h4>Subscribe Our Newsletter:</h4>
                        </div>
                        <div class="col-lg-8">
                            <form id="subscribe" action="" method="get">
                                <div class="row">
                                    <div class="col-lg-9">
                                        <fieldset>
                                            <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                                        </fieldset>
                                    </div>
                                    <div class="col-lg-3">
                                        <fieldset>
                                            <button type="submit" id="form-submit" class="main-dark-button">Submit</button>
                                        </fieldset>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                            </div>
                                                            </div>
                </div>
            </div>
        
                                                    

 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


    </body>
    
    
</html>
