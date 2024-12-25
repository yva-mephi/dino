import React from "react";
import { useTheme } from './ThemeContext.jsx'; // Импортируем хук
import './Toggle.scss';

function Toggle() {
    const { isDarkMode, toggleTheme } = useTheme(); // Получаем значения из контекста

    return (
        <div className="toggleWrapper">
            <input
                type="checkbox"
                className="dn"
                id="dn"
                checked={isDarkMode} // Устанавливаем состояние чекбокса
                onChange={toggleTheme} // Обработчик переключения
            />
            <label htmlFor="dn" className="toggle">
                <span className="toggle__handler">
                    <span className="crater crater--1"></span>
                    <span className="crater crater--2"></span>
                    <span className="crater crater--3"></span>
                </span>
                <span className="star star--1"></span>
                <span className="star star--2"></span>
                <span className="star star--3"></span>
                <span className="star star--4"></span>
                <span className="star star--5"></span>
                <span className="star star--6"></span>
            </label>
        </div>
    );
}

export default Toggle;