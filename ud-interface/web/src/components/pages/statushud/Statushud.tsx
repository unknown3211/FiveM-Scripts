import React, { useState, useEffect } from 'react';
import './Statushud.css';

interface StatusHudData {
    action: string;
    title?: string;
    content?: string;
}

export default function Statushud() {
    const [visible, setVisible] = useState(false);
    const [title, setTitle] = useState('UnKnownJohn');
    const [content, setContent] = useState('UD Status Hud');

    useEffect(() => {
        const handleMessage = (event: MessageEvent) => {
            const data: StatusHudData = event.data;
            if (data.action === "openstatushud") {
                if (data.title && data.content) {
                    setTitle(data.title);
                    setContent(data.content);   
                    setVisible(true);
                }
            } else if (data.action === "closestatushud") {
                setTitle('');
                setContent('');
                setVisible(false);
            }
        };

        window.addEventListener('message', handleMessage);
        return () => {
            window.removeEventListener('message', handleMessage);
        };
    }, []);

    if (!visible) return null;
    
    return (
        <div className="container" id="main">
            <div className="title" id="content1">
                {title}
            </div>
            <div className="separator" />
            <div className="separator2" />
            <div className="content" id="content2">{content}</div>
        </div>
    );
}