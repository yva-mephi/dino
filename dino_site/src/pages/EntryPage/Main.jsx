import React, { useRef, useState, useEffect } from 'react';
import { handleFormSubmit } from './formValidation.js';
import { useNavigate } from 'react-router-dom';

const Main = () => {
    const navigate = useNavigate();
    const [message, setMessage] = useState('');
    const [showMessage, setShowMessage] = useState(false);

    const registerNicknameRef = useRef();
    const registerPasswordRef = useRef();
    const registerFirstNameRef = useRef();
    const registerLastNameRef = useRef();
    const registerPatronymicRef = useRef();

    const loginNicknameRef = useRef();
    const loginPasswordRef = useRef();

    const handleRegister = (e) => {
        e.preventDefault();
        const registerData = {
            nickname: registerNicknameRef.current.value,
            password: registerPasswordRef.current.value,
            firstName: registerFirstNameRef.current.value,
            lastName: registerLastNameRef.current.value,
            patronymic: registerPatronymicRef.current.value,
        };
        handleFormSubmit('register', registerData, setMessage, navigate);
        resetForm();
    };

    const handleLogin = (e) => {
        e.preventDefault();
        const loginData = {
            nickname: loginNicknameRef.current.value,
            password: loginPasswordRef.current.value,
        };
        handleFormSubmit('login', loginData, setMessage, navigate);
        resetForm();
    };

    const resetForm = () => {
        registerNicknameRef.current.value = '';
        registerPasswordRef.current.value = '';
        registerFirstNameRef.current.value = '';
        registerLastNameRef.current.value = '';
        registerPatronymicRef.current.value = '';
        loginNicknameRef.current.value = '';
        loginPasswordRef.current.value = '';
    };

    useEffect(() => {
        if (message) {
            setShowMessage(true);
            const timer = setTimeout(() => {
                setShowMessage(false);
                setMessage('');
            }, 3000);
            return () => clearTimeout(timer);
        }
    }, [message]);

    return (
        <main className="mainEntry">
            <div className="blurBackground"></div>
            <input aria-hidden="true" id="chk" className="chk" type="checkbox" />
            <div className="signup">
                <form onSubmit={handleRegister}>
                    <label aria-hidden="true" htmlFor="chk" className="registrationlabelEntry">Регистрация</label>
                    <input ref={registerNicknameRef} name="nickname" placeholder="Никнейм" required type="text"
                        className="dataEntry" />
                    <input ref={registerPasswordRef} name="password" placeholder="Пароль" required type="password"
                        className="dataEntry" />
                    <input ref={registerFirstNameRef} name="firstName" placeholder="Имя" required type="text"
                        className="dataEntry" />
                    <input ref={registerLastNameRef} name="lastName" placeholder="Фамилия" required type="text"
                        className="dataEntry" />
                    <input ref={registerPatronymicRef} name="patronymic" placeholder="Отчество" required type="text"
                        className="dataEntry" />
                    <button className="buttonEntry">Зарегистрироваться</button>
                </form>
            </div>
            <div className="login">
                <form onSubmit={handleLogin}>
                    <label aria-hidden="true" htmlFor="chk" className="loginlabelEntry">Войти</label>
                    <input ref={loginNicknameRef} name="nickname" placeholder="Никнейм" required type="text"
                        className="dataEntry" />
                    <input ref={loginPasswordRef} name="password" placeholder="Пароль" required type="password"
                        className="dataEntry" />
                    <button className="buttonEntry">Войти</button>
                </form>
            </div>
            {message && (
                <p className={`${message.includes("успешно") ? "message" : "error"} ${showMessage ? "show" : ''}`}>
                    {message}
                </p>
            )}
        </main>
    );
};

export default Main;