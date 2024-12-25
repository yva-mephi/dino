import React, { useEffect, useRef, useState } from 'react';
import './MainStyles.scss';
import { useTheme } from '../../utils/ThemeContext.jsx';
import Toggle from '../../utils/Toggle.jsx';
import { useNavigate } from 'react-router-dom';
import { getCurrentUser } from '../../utils/utils.js';
import ArrowForwardIcon from '@mui/icons-material/ArrowForward';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import PersonIcon from '@mui/icons-material/Person';
import ExitToAppIcon from '@mui/icons-material/ExitToApp';
import AccountCircleIcon from '@mui/icons-material/AccountCircle';

const Main = () => {
    const { isDarkMode } = useTheme();
    const navigate = useNavigate();
    const [currentUser, setCurrentUser] = useState(null);
    const [isDropdownOpen, setDropdownOpen] = useState(false);
    const categoriesRef = useRef(null);
    const categories = ['Электроника', 'Одежда', 'Книги', 'Игры', 'Аксессуары', 'Косметика', 'Спорт', 'Техника'];

    useEffect(() => {
        const user = getCurrentUser();
        if (user) {
            setCurrentUser(user);
        }
    }, []);

    const handleLogout = () => {
        localStorage.removeItem('currentUser ');
        navigate('/');
    };

    const scrollCategories = (direction) => {
        if (categoriesRef.current) {
            const scrollAmount = 150; // Количество пикселей для прокрутки
            categoriesRef.current.scrollBy({
                left: direction === 'left' ? -scrollAmount : scrollAmount,
                behavior: 'smooth'
            });
        }
    };

    return (
        <div className={`mainPage ${isDarkMode ? 'darkMode' : ''}`}>
            <header className="headerMain">
                <div className="userSection">
                    {currentUser && (
                        <div className="userInfo" onClick={() => setDropdownOpen(!isDropdownOpen)}>
                            <img src={currentUser.avatar || './avatardefolt.png'} alt="Avatar" className="userAvatar" />
                            <span className="userName">{`${currentUser.firstName} ${currentUser.lastName}`}</span>
                            {isDropdownOpen && (
                                <div className="dropdownMenu">
                                    <button onClick={() => navigate('/profile')}>
                                        <AccountCircleIcon /> Личный кабинет
                                    </button>
                                    <button onClick={handleLogout}>
                                        <ExitToAppIcon /> Выйти
                                    </button>
                                </div>
                            )}
                        </div>
                    )}
                </div>
                <nav className="navMain">
                    <ul>
                        <li><a href="#about">О нас</a></li>
                        <li><a href="#products">Продукты</a></li>
                        <li><a href="#reviews">Отзывы</a></li>
                        <li><a href="#guarantees">Гарантии</a></li>
                        <li><a href="#contact">Контакты</a></li>
                    </ul>
                </nav>
                <div className="toggleContainer">
                    <Toggle />
                </div>
            </header>
            <section id="about" className="section about">
                <h2>О нас</h2>
                <p>Мы - команда профессионалов, предлагающая широкий ассортимент качественных продуктов. Наша цель - обеспечить вас всем необходимым для комфортной жизни. Мы постоянно работаем над улучшением нашего сервиса и расширением ассортимента, чтобы удовлетворить все ваши потребности.</p>
            </section>
            <section id="products" className="section products">
                <h2>Продукты</h2>
                <div className="categories">
                    <button className="scroll-button left" onClick={() => scrollCategories('left')}><ArrowBackIcon /></button>
                    <div className="category-list" ref={categoriesRef}>
                        {categories.map((category, index) => (
                            <div key={index} className="category-item">{category}</div>
                        ))}
                    </div>
                    <button className="scroll-button right" onClick={() => scrollCategories('right')}><ArrowForwardIcon /></button>
                </div>
                <div className="product-list">
                    {/* Здесь можно добавить динамическое отображение продуктов */}
                </div>
            </section>
            <section id="reviews" className="section reviews">
                <h2>Отзывы</h2>
                <p>Мы ценим мнение наших клиентов. Оставьте свой отзыв о наших продуктах и услугах. Ваша обратная связь помогает нам стать лучше. Мы стремимся к тому, чтобы каждый клиент остался доволен покупкой и обслуживанием. Ваши отзывы важны для нас и помогают другим пользователям сделать правильный выбор.</p>
            </section>
            <section id="guarantees" className="section guarantees">
                <h2>Гарантии</h2>
                <p>Мы предоставляем гарантии на все наши продукты. Наша политика гарантии обеспечивает защиту ваших прав как потребителя. Если у вас возникли проблемы с продуктом, мы готовы помочь вам в решении любых вопросов. Узнайте больше о наших условиях гарантии и как мы можем помочь вам в случае необходимости.</p>
            </section>
            <section id="contact" className="section contact">
                <h2>Контакты</h2>
                <p>Свяжитесь с нами по адресу: example@example.com. Мы всегда рады помочь вам и ответить на ваши вопросы. Наша команда поддержки работает круглосуточно, чтобы обеспечить вам лучший сервис. Не стесняйтесь обращаться к нам по любым вопросам или предложениям.</p>
            </section>
            <footer className="footerMain">
                <p>© {new Date().getFullYear()} Магазин. Все права защищены.</p>
            </footer>
        </div>
    );
};

export default Main;
