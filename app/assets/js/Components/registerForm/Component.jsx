import React from 'react';
import axios from 'axios';

class RegisterForm extends React.Component {
    state = {
        name: "",
        last_name: "",
        email: "",
        password: "",
        age: "",
        role: "ROLE_STUDENT"
    };
    constructor(props) {
        super(props);
    }

    handleName = (event) => {
        this.setState({name: event.target.value});
    }

    handleLastname = (event) => {
        this.setState({last_name: event.target.value});
    }

    handleEmail = (event) => {
        this.setState({email: event.target.value});
    }

    handlePassword = (event) => {
        this.setState({password: event.target.value});
    }

    handleAge = (event) => {
        this.setState({age: event.target.value});
    }

    handleRadio = (role) => {
        this.setState({role: role})
    }

    handleClick = () => {
        if(
            this.state.name !==  "" &&
            this.state.last_name !== "" &&
            this.state.email !== "" &&
            this.state.password !== "" &&
            Number.isInteger(parseInt(this.state.age))
        ) {
            const user = {...this.state};
            axios.post(`http://0.0.0.0:3000/user/create`, {user})
                .then(res => {
                    if (res.status >= 200 && res.status < 300) {
                        localStorage.setItem('current_user', JSON.stringify({...res.data,loggedIn: true}));
                        window.location.replace("http://0.0.0.0:3000/");
                    }
                })
        }
    };

    render() {
        return (
            <div className="RegisterForm">
                <h1>Registracija</h1>
                <div className="radio">
                    <label>
                        <input type="radio" checked={this.state.role === 'ROLE_STUDENT'} onChange={() => this.handleRadio('ROLE_STUDENT')}/>
                         Studentas
                    </label>
                    <label>
                        <input type="radio" checked={this.state.role === 'ROLE_TEACHER'} onChange={() => this.handleRadio('ROLE_TEACHER')}/>
                         Dėstytojas
                    </label>
                </div>
                <input type="email" placeholder="El. paštas" className="input input-text" value={this.state.email} onChange={(e) => this.handleEmail(e)}/>
                <input type="text" placeholder="Vardas" className="input input-text" value={this.state.name} onChange={(e) => this.handleName(e)}/>
                <input type="text" placeholder="Pavardė" className="input input-text" value={this.state.last_name} onChange={(e) => this.handleLastname(e)}/>
                <input type="text" placeholder="Amžius" className="input input-text" value={this.state.age} onChange={(e) => this.handleAge(e)}/>
                <input type="password" placeholder="Slaptažodis" className="input input-text" value={this.state.password} onChange={(e) => this.handlePassword(e)}/>
                <button className="btns btn-login" onClick={this.handleClick}>Registruotis</button>
            </div>
        );
    }
}


export default RegisterForm;
