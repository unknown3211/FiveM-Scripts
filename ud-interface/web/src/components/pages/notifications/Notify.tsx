import React, { useEffect } from 'react';
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

export default function Notify() {
    const notifyInfo = (text: string, duration: number) => toast.info(text, { autoClose: duration });
    const notifyWarning = (text: string, duration: number) => toast.warn(text, { autoClose: duration });
    const notifySuccess = (text: string, duration: number) => toast.success(text, { autoClose: duration });
    const notifyError = (text: string, duration: number) => toast.error(text, { autoClose: duration });

    const displayNotification = (type: string, text: string, duration: number) => {
        switch (type) {
            case 'info':
                notifyInfo(text, duration);
                break;
            case 'warning':
                notifyWarning(text, duration);
                break;
            case 'success':
                notifySuccess(text, duration);
                break;
            case 'error':
                notifyError(text, duration);
                break;
            default:
                console.warn(`Unknown notification type: ${type}`);
        }
    };

    useEffect(() => {
        const handleMessage = (event: MessageEvent) => {
            const data = event.data;
            if (data.type === 'showNotification') {
                const { notificationType, text, duration } = data;
                displayNotification(notificationType, text, duration);
            }
        };

        window.addEventListener('message', handleMessage);
        return () => {
            window.removeEventListener('message', handleMessage);
        };
    }, []);

    return (
        <div style={{ position: 'fixed', top: 0, right: 0, zIndex: 9999 }}>
            <ToastContainer
                position="top-right"
                hideProgressBar={false}
                newestOnTop={false}
                closeOnClick
                rtl={false}
                pauseOnFocusLoss
                draggable
                pauseOnHover
                theme="dark"
            />
        </div>
    );
}